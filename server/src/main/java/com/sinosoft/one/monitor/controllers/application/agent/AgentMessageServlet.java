package com.sinosoft.one.monitor.controllers.application.agent;

import com.alibaba.fastjson.JSON;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.Schema;
import com.dyuproject.protostuff.runtime.ExplicitIdStrategy;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.sinosoft.monitor.agent.store.model.exception.ExceptionInfo;
import com.sinosoft.monitor.agent.store.model.url.MethodTraceLog;
import com.sinosoft.monitor.agent.store.model.url.TraceLog;
import com.sinosoft.monitor.agent.store.model.url.UrlTraceLog;
import com.sinosoft.one.monitor.application.domain.MessageEvent;
import com.sinosoft.one.util.queue.QueuesHolder;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import java.io.*;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import java.util.concurrent.BlockingQueue;
import java.util.zip.Inflater;

/**
 * Created with IntelliJ IDEA.
 * User: daojian
 * Date: 13-9-18
 * Time: 下午2:26
 * To change this template use File | Settings | File Templates.
 */
public class AgentMessageServlet extends HttpServlet {

    public  static final String QUEUE_NAME="APP_AGENT_MSG";
    private Logger logger = LoggerFactory.getLogger(AgentMessageServlet.class);

    private BlockingQueue<TraceLog> queue;

    private Schema<TraceLog> schema;

    private long limitEndTime = 0;

    private String limitEndTimeStr = "";

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

    boolean canRun = false;

    private void setLimitEndTime(){

        URL url = this.getClass().getClassLoader().getResource("META-INF/serial");
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(url.getFile()));
            String serialCode = reader.readLine().trim();
            limitEndTimeStr = Integer.valueOf(serialCode, 16)+"".trim();
            limitEndTime = sdf.parse(limitEndTimeStr).getTime();
            logger.warn("产品到期日：" + limitEndTimeStr);
            canRun = true;
        }catch (Exception e){
            logger.error("没有找到文件：serial，或serial码不正确！");
        }finally {
            if (reader!=null){
                try {
                    reader.close();
                } catch (IOException e) {}
            }
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        setLimitEndTime();

        ExplicitIdStrategy.Registry r = new ExplicitIdStrategy.Registry();
        r = r.registerPojo(TraceLog.class,1);
        r = r.registerPojo(UrlTraceLog.class,2);
        r = r.registerPojo(ExceptionInfo.class,3);
        r = r.registerPojo(MethodTraceLog.class,4);
        schema = RuntimeSchema.getSchema(TraceLog.class, r.strategy);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {
        doPost(req,resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        long start = System.currentTimeMillis();

        if (canRun){
            //如果过期则返回
            if (start>limitEndTime){
                logger.error("监控产品试用已到期,到期日："+limitEndTimeStr);
                //设置为不可运行
                canRun = false;
                return;
            }
        } else {
            //不可运行重新加载文件
            setLimitEndTime();
            return;
        }

        DataInputStream input = new DataInputStream(request.getInputStream());
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        byte[] data = null;
        byte[] b = new byte[1024];
        int read = 0;
        // 转换数据流
        while ((read = input.read(b)) > 0) {
            byteOut.write(b, 0, read);
        }
        data = byteOut.toByteArray();
        logger.debug("data size compress:"+data.length);
        data = decompress(data);
        TraceLog traceLog = new TraceLog();
        ProtostuffIOUtil.mergeFrom(data, traceLog, schema);
        if(queue==null){
            queue = QueuesHolder.getQueue(QUEUE_NAME);
        }
        long end = System.currentTimeMillis();
        queue.offer(traceLog);
        logger.debug("process data wrapper cost:" + (end - start) + "ms," + "ip:" + traceLog.getIp() + ",port:" + traceLog.getPort());
        logger.debug("traceLog info:"+ JSON.toJSONString(traceLog));
        input.close();
        BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream());
        output.write("Success".getBytes());
        output.close();
    }
    /**
     * 解压缩
     *
     * @param data
     *            待压缩的数据
     * @return byte[] 解压缩后的数据
     */
    public static byte[] decompress(byte[] data) {
        byte[] output = new byte[0];

        Inflater decompresser = new Inflater();
        decompresser.reset();
        decompresser.setInput(data);

        ByteArrayOutputStream o = new ByteArrayOutputStream(data.length);
        try {
            byte[] buf = new byte[1024];
            while (!decompresser.finished()) {
                int i = decompresser.inflate(buf);
                o.write(buf, 0, i);
            }
            output = o.toByteArray();
        } catch (Exception e) {
            output = data;
            e.printStackTrace();
        } finally {
            try {
                o.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        decompresser.end();
        return output;
    }
}
