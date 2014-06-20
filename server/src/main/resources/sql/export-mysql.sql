

  CREATE TABLE ge_monitor_account 
   (	
    ID VARCHAR(32), 
	LOGIN_NAME VARCHAR(100), 
	PASSWORD varchar(50), 
	NAME VARCHAR(50), 
	EMAIL VARCHAR(100), 
	PHONE VARCHAR(30), 
	CREATE_TIME timestamp, 
	STATUS VARCHAR(50)
   );
   alter table ge_monitor_account modify column ID VARCHAR(32) comment '用户ID';
   alter table ge_monitor_account modify column LOGIN_NAME VARCHAR(100) comment '登录名';
   alter table ge_monitor_account modify column PASSWORD varchar(50) comment '密码';
   alter table ge_monitor_account modify column NAME VARCHAR(50) comment '用户名';
   alter table ge_monitor_account modify column EMAIL VARCHAR(100) comment '邮箱';
   alter table ge_monitor_account modify column PHONE VARCHAR(30) comment '电话';
   alter table ge_monitor_account modify column CREATE_TIME timestamp comment '更新时间';
   alter table ge_monitor_account modify column STATUS VARCHAR(50) comment '状态';


  CREATE TABLE ge_monitor_account_auth 
   (	
    ID VARCHAR(32), 
	ACCOUNT_ID VARCHAR(32), 
	ROLE VARCHAR(10)
   ) ;

   alter table ge_monitor_account_auth modify column ID VARCHAR(32) comment '授权id';
   alter table ge_monitor_account_auth modify column ACCOUNT_ID VARCHAR(32) comment '用户ID';
   alter table ge_monitor_account_auth modify column ROLE VARCHAR(10) comment '角色';
   alter table ge_monitor_account_auth comment '用户授权表';


  CREATE TABLE ge_monitor_alarm 
   (	
    ID VARCHAR(32), 
	SEVERITY VARCHAR(20), 
	MESSAGE VARCHAR(3000), 
	ALARM_SOURCE VARCHAR(20), 
	MONITOR_ID VARCHAR(32), 
	MONITOR_TYPE VARCHAR(50), 
	ATTRIBUTE_ID VARCHAR(32), 
	CREATE_TIME timestamp, 
	OWNER_NAME VARCHAR(100), 
	SUB_RESOURCE_TYPE VARCHAR(32), 
	SUB_RESOURCE_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_alarm modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_alarm modify column SEVERITY VARCHAR(20) comment '严重级别(severity)';
   alter table ge_monitor_alarm modify column MESSAGE VARCHAR(3000) comment '警报信息(message)';
   alter table ge_monitor_alarm modify column ALARM_SOURCE VARCHAR(20) comment '警报来源(日志,异常)';
   alter table ge_monitor_alarm modify column MONITOR_ID VARCHAR(32) comment '监视器ID';
   alter table ge_monitor_alarm modify column MONITOR_TYPE VARCHAR(50) comment '监视器类型';
   alter table ge_monitor_alarm modify column ATTRIBUTE_ID VARCHAR(32) comment '属性ID';
   alter table ge_monitor_alarm modify column CREATE_TIME timestamp comment '创建时间(createtime)';
   alter table ge_monitor_alarm modify column OWNER_NAME VARCHAR(100) comment '所有者(ownername)';
   alter table ge_monitor_alarm modify column SUB_RESOURCE_TYPE VARCHAR(32) comment '子资源类型';
   alter table ge_monitor_alarm modify column SUB_RESOURCE_ID VARCHAR(32) comment '子资源ID';
   alter table ge_monitor_alarm comment '应用系统预警信息表';


  CREATE TABLE ge_monitor_application 
   (	
    ID VARCHAR(32), 
	APPLICATION_NAME VARCHAR(100) not null, 
	CN_NAME VARCHAR(300), 
	APPLICATION_IP VARCHAR(100), 
	APPLICATION_PORT VARCHAR(5), 
	CREATE_TIME timestamp not null, 
	CREATOR_ID VARCHAR(32) not null, 
	MODIFY_TIME timestamp, 
	MODIFIER_ID VARCHAR(32), 
	STATUS VARCHAR(1) DEFAULT '1', 
	`INTERVAL` decimal(10,0) 
   ) ;

   alter table ge_monitor_application modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_application modify column APPLICATION_NAME VARCHAR(100) comment '应用系统英文名称';
   alter table ge_monitor_application modify column CN_NAME VARCHAR(300) comment '应用系统中文名称';
   alter table ge_monitor_application modify column CREATE_TIME timestamp comment '创建时间';
   alter table ge_monitor_application modify column CREATOR_ID VARCHAR(32) comment '创建人ID';
   alter table ge_monitor_application modify column MODIFY_TIME timestamp comment '修改时间';
   alter table ge_monitor_application modify column MODIFIER_ID VARCHAR(32) comment '修改人ID';
   alter table ge_monitor_application modify column STATUS VARCHAR(1) comment '有效状态:1有效,0删除';
   alter table ge_monitor_application modify column `INTERVAL` decimal(10,0) comment '轮询间隔';
   alter table ge_monitor_application comment '存储需要监控的应用系统信息';


  CREATE TABLE ge_monitor_attribute 
   (	
    ID VARCHAR(32), 
	RESOURCE_TYPE VARCHAR(32), 
	ATTRIBUTE VARCHAR(255), 
	UNITS VARCHAR(10), 
	ATTRIBUTE_CN VARCHAR(255)
   ) ;

   alter table ge_monitor_attribute modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_attribute modify column RESOURCE_TYPE VARCHAR(32) comment '资源类型';
   alter table ge_monitor_attribute modify column ATTRIBUTE VARCHAR(255) comment '属性';
   alter table ge_monitor_attribute modify column UNITS VARCHAR(10) comment '单位';
   alter table ge_monitor_attribute modify column ATTRIBUTE_CN VARCHAR(255) comment '属性中文名称';
   alter table ge_monitor_attribute comment '属性信息表';


  CREATE TABLE ge_monitor_attribute_action 
   (	
    ID VARCHAR(32) not null, 
	RESOURCE_ID VARCHAR(32) not null, 
	ATTRIBUTE_ID VARCHAR(32) not null, 
	ACTION_ID VARCHAR(32) not null, 
	ACTION_TYPE VARCHAR(20) not null, 
	SEVERITY VARCHAR(32) not null
   ) ;

   alter table ge_monitor_attribute_action modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_attribute_action modify column RESOURCE_ID VARCHAR(32) comment '资源ID';
   alter table ge_monitor_attribute_action modify column ATTRIBUTE_ID VARCHAR(32) comment '属性ID';
   alter table ge_monitor_attribute_action modify column ACTION_ID VARCHAR(32) comment '动作ID';
   alter table ge_monitor_attribute_action modify column ACTION_TYPE VARCHAR(20) comment '动作类型';
   alter table ge_monitor_attribute_action modify column SEVERITY VARCHAR(32) comment '严重程度';
   alter table ge_monitor_attribute_action comment '属性动作信息表';


  CREATE TABLE ge_monitor_attribute_threshold 
   (	
    ID VARCHAR(32) not null, 
	RESOURCE_ID VARCHAR(32) not null, 
	ATTRIBUTE_ID VARCHAR(32) not null, 
	THRESHOLD_ID VARCHAR(32) not null
   ) ;

   alter table ge_monitor_attribute_threshold modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_attribute_threshold modify column RESOURCE_ID VARCHAR(32) comment '资源ID';
   alter table ge_monitor_attribute_threshold modify column ATTRIBUTE_ID VARCHAR(32) comment '属性ID';
   alter table ge_monitor_attribute_threshold modify column THRESHOLD_ID VARCHAR(32) comment '阈值ID';
   alter table ge_monitor_attribute_threshold comment '属性阈值信息表';


  CREATE TABLE ge_monitor_biz_scenario 
   (	
    ID VARCHAR(32) not null, 
	NAME VARCHAR(300) not null, 
	BIZ_SCENARIO_GRADE VARCHAR(15), 
	APPLICATION_ID VARCHAR(32) not null, 
	CREATE_TIME timestamp not null, 
	CREATOR_ID VARCHAR(32) not null, 
	MODIFY_TIME timestamp, 
	MODIFIER_ID VARCHAR(32), 
	STATUS VARCHAR(1) DEFAULT '1'
   ) ;

   alter table ge_monitor_biz_scenario modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_biz_scenario modify column NAME VARCHAR(300) comment '业务场景名称';
   alter table ge_monitor_biz_scenario modify column BIZ_SCENARIO_GRADE VARCHAR(15) comment '业务场景级别';
   alter table ge_monitor_biz_scenario modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统ID';
   alter table ge_monitor_biz_scenario modify column CREATE_TIME timestamp comment '创建时间';
   alter table ge_monitor_biz_scenario modify column CREATOR_ID VARCHAR(32) comment '创建人ID';
   alter table ge_monitor_biz_scenario modify column MODIFY_TIME timestamp comment '修改时间';
   alter table ge_monitor_biz_scenario modify column MODIFIER_ID VARCHAR(32) comment '修改人ID';
   alter table ge_monitor_biz_scenario modify column STATUS VARCHAR(1) comment '有效状态:1有效,0删除';
   alter table ge_monitor_biz_scenario comment '存储指定应用系统的业务场景信息';


  CREATE TABLE ge_monitor_biz_scenario_url 
   (	
    BIZ_SCENARIO_ID VARCHAR(32) not null, 
	URL_ID VARCHAR(32) not null
   ) ;

   alter table ge_monitor_biz_scenario_url modify column BIZ_SCENARIO_ID VARCHAR(32) comment '业务场景ID';
   alter table ge_monitor_biz_scenario_url modify column URL_ID VARCHAR(32) comment 'URLID';
   alter table ge_monitor_biz_scenario_url comment '应用系统业务场景URL信息表';


  CREATE TABLE ge_monitor_email_action 
   (	
    ID VARCHAR(32), 
	FROM_ADDRESS VARCHAR(250) not null, 
	TO_ADDRESS VARCHAR(250) not null, 
	SUBJECT VARCHAR(100) not null, 
	CONTENT VARCHAR(3000), 
	SMTP_SERVER VARCHAR(100), 
	SMTP_PORT VARCHAR(5), 
	MAIL_FORMAT VARCHAR(1), 
	APPEND_MESSAGE VARCHAR(100), 
	NAME VARCHAR(100) not null
   ) ;

   alter table ge_monitor_email_action modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_email_action modify column FROM_ADDRESS VARCHAR(250) comment '发件地址(fromaddress)';
   alter table ge_monitor_email_action modify column TO_ADDRESS VARCHAR(250) comment '收件地址(toaddress)';
   alter table ge_monitor_email_action modify column SUBJECT VARCHAR(100) comment '主题(subject)';
   alter table ge_monitor_email_action modify column CONTENT VARCHAR(3000) comment '内容(message)';
   alter table ge_monitor_email_action modify column SMTP_SERVER VARCHAR(100) comment '邮件服务器(smtpserver)';
   alter table ge_monitor_email_action modify column SMTP_PORT VARCHAR(5) comment '邮件服务器端口(smtpport)';
   alter table ge_monitor_email_action modify column MAIL_FORMAT VARCHAR(1) comment '邮件格式(mailformat)';
   alter table ge_monitor_email_action modify column APPEND_MESSAGE VARCHAR(100) comment '附加信息(appendmessage)';
   alter table ge_monitor_email_action modify column NAME VARCHAR(100) comment '动作名称(name)';
   alter table ge_monitor_email_action comment '应用系统邮件动作信息表';


  CREATE TABLE ge_monitor_eum_url 
   (	
    ID VARCHAR(32), 
	URL VARCHAR(300) not null, 
	APPLICATION_ID VARCHAR(32), 
	RECORD_TIME timestamp, 
	URL_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_eum_url modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_eum_url modify column URL VARCHAR(300) comment 'URL地址';
   alter table ge_monitor_eum_url modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统ID';
   alter table ge_monitor_eum_url comment '业务仿真URL信息表';


  CREATE TABLE ge_monitor_eum_url_ava 
   (	
    ID VARCHAR(32), 
	EUM_URL_ID VARCHAR(32), 
	STATE VARCHAR(1), 
	RECORD_TIME timestamp, 
	`INTERVAL` decimal(10,0) not null 
   ) ;

   alter table ge_monitor_eum_url_ava modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_eum_url_ava modify column EUM_URL_ID VARCHAR(32) comment '业务仿真ID';
   alter table ge_monitor_eum_url_ava modify column STATE VARCHAR(1) comment '状态 1---可用 0---不可用';
   alter table ge_monitor_eum_url_ava modify column RECORD_TIME timestamp comment '记录时间';
   alter table ge_monitor_eum_url_ava modify column `INTERVAL` decimal(10,0) comment '轮询间隔';
   alter table ge_monitor_eum_url_ava comment '应用系统可用性临时表';


  CREATE TABLE ge_monitor_eum_url_ava_sta 
   (	
    ID VARCHAR(32), 
	EUM_URL_ID VARCHAR(32), 
	NORMAL_RUNTIME decimal(10,0) , 
	TOTAL_FAILURE_TIME decimal(10,0) , 
	FAILURE_COUNT decimal(10,0) , 
	AVG_FAILURE_TIME decimal(10,0) , 
	RECORD_TIME timestamp
   ) ;

   alter table ge_monitor_eum_url_ava_sta modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_eum_url_ava_sta modify column EUM_URL_ID VARCHAR(32) comment '业务仿真URLID';
   alter table ge_monitor_eum_url_ava_sta modify column NORMAL_RUNTIME decimal(10,0) comment '正常运行时间';
   alter table ge_monitor_eum_url_ava_sta modify column TOTAL_FAILURE_TIME decimal(10,0) comment '总失败时间';
   alter table ge_monitor_eum_url_ava_sta modify column FAILURE_COUNT decimal(10,0) comment '停止次数';
   alter table ge_monitor_eum_url_ava_sta modify column AVG_FAILURE_TIME decimal(10,0) comment '平均故障间隔时间';
   alter table ge_monitor_eum_url_ava_sta modify column RECORD_TIME timestamp comment '记录时间';
   alter table ge_monitor_eum_url_ava_sta comment '业务仿真URL可用性统计表';


  CREATE TABLE ge_monitor_exception_info 
   (	
    ID VARCHAR(32), 
	APPLICATION_ID VARCHAR(32), 
	EXCEPTION_DESCRIPTION VARCHAR(500), 
	EXCEPTION_STACK_TRACE longtext, 
	RECORD_TIME timestamp, 
	URL_TRACE_LOG_ID VARCHAR(32), 
	ALARM_ID VARCHAR(32), 
	URL VARCHAR(300), 
	REQUEST_PARAMS longtext
   ) ;

   alter table ge_monitor_exception_info modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_exception_info modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统';
   alter table ge_monitor_exception_info modify column EXCEPTION_DESCRIPTION VARCHAR(500) comment '异常描述';
   alter table ge_monitor_exception_info modify column EXCEPTION_STACK_TRACE longtext comment '异常堆栈';
   alter table ge_monitor_exception_info modify column RECORD_TIME timestamp comment '异常时间';
   alter table ge_monitor_exception_info modify column URL_TRACE_LOG_ID VARCHAR(32) comment 'URL追踪日志ID';
   alter table ge_monitor_exception_info modify column ALARM_ID VARCHAR(32) comment '告警消息ID';
   alter table ge_monitor_exception_info modify column URL VARCHAR(300) comment 'URL地址';
   alter table ge_monitor_exception_info modify column REQUEST_PARAMS longtext comment 'URL请求参数';
   alter table ge_monitor_exception_info comment '记录所有的异常信息';


  CREATE TABLE ge_monitor_group 
   (	
    ID decimal(19,0) not null, 
	NAME VARCHAR(255) not null
   ) ;


  CREATE TABLE ge_monitor_group_permission 
   (	
    GROUP_ID decimal(19,0), 
	PERMISSION VARCHAR(255)
   ) ;


  CREATE TABLE ge_monitor_method 
   (	
    ID VARCHAR(32) not null, 
	DESCRIPTION VARCHAR(300), 
	CLASS_NAME VARCHAR(500) not null, 
	METHOD_NAME VARCHAR(100) not null, 
	THRESHOLD decimal(6,0), 
	CREATE_TIME timestamp not null, 
	CREATOR_ID VARCHAR(32) not null, 
	MODIFY_TIME timestamp, 
	MODIFIER_ID VARCHAR(32), 
	STATUS VARCHAR(1) DEFAULT '1'
   ) ;

   alter table ge_monitor_method modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_method modify column DESCRIPTION VARCHAR(300) comment '方法描述';
   alter table ge_monitor_method modify column CLASS_NAME VARCHAR(500) comment '方法所属类名';
   alter table ge_monitor_method modify column METHOD_NAME VARCHAR(100) comment '方法名称';
   alter table ge_monitor_method modify column THRESHOLD decimal(6,0) comment '方法阈值,单位ms';
   alter table ge_monitor_method modify column CREATE_TIME timestamp comment '创建时间';
   alter table ge_monitor_method modify column CREATOR_ID VARCHAR(32) comment '创建人ID';
   alter table ge_monitor_method modify column MODIFY_TIME timestamp comment '修改时间';
   alter table ge_monitor_method modify column MODIFIER_ID VARCHAR(32) comment '修改人ID';
   alter table ge_monitor_method modify column STATUS VARCHAR(1) comment '有效状态:1有效,0删除';
   alter table ge_monitor_method comment '应用系统方法信息表';


  CREATE TABLE ge_monitor_method_responsetime 
   (	
    ID VARCHAR(32), 
	METHOD_NAME VARCHAR(300), 
    URL_ID VARCHAR(32), 
	MIN_RESPONSE_TIME decimal(10,0), 
	MAX_RESPONSE_TIME decimal(10,0), 
	TOTAL_RESPONSE_TIME decimal(10,0) , 
	TOTAL_COUNT decimal(10,0) , 
	APPLICATION_ID VARCHAR(32), 
	RECORD_TIME timestamp, 
    METHOD_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_method_responsetime modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_method_responsetime modify column METHOD_NAME VARCHAR(300) comment '方法名';
   alter table ge_monitor_method_responsetime modify column URL_ID VARCHAR(32) comment 'URL信息ID';
   alter table ge_monitor_method_responsetime modify column MIN_RESPONSE_TIME decimal(10,0) comment '最小响应时间';
   alter table ge_monitor_method_responsetime modify column MAX_RESPONSE_TIME decimal(10,0) comment '最大响应时间';
   alter table ge_monitor_method_responsetime modify column TOTAL_RESPONSE_TIME decimal(10,0) comment '总响应时间';
   alter table ge_monitor_method_responsetime modify column TOTAL_COUNT decimal(10,0) comment '总次数';
   alter table ge_monitor_method_responsetime modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统';
   alter table ge_monitor_method_responsetime modify column RECORD_TIME timestamp comment '记录时间';
   alter table ge_monitor_method_responsetime modify column METHOD_ID VARCHAR(32) comment '方法信息ID';
   alter table ge_monitor_method_responsetime comment '方法响应时间';


  CREATE TABLE ge_monitor_method_tl_temp 
   (	
    ID VARCHAR(32), 
	URL_TRACE_LOG_ID VARCHAR(32), 
	METHOD_NAME VARCHAR(100), 
	CLASS_NAME VARCHAR(200), 
    IN_PARAM longtext, 
	OUT_PARAM longtext, 
	BEGIN_TIME timestamp, 
	END_TIME timestamp, 
	CONSUME_TIME decimal(10,0) , 
	RECORD_TIME timestamp, 
	METHOD_ID VARCHAR(32)
   ) ;


  CREATE TABLE ge_monitor_method_trace_log 
   (	
    ID VARCHAR(32), 
	URL_TRACE_LOG_ID VARCHAR(32), 
	METHOD_NAME VARCHAR(100), 
	CLASS_NAME VARCHAR(200), 
	IN_PARAM longtext, 
	OUT_PARAM longtext, 
	BEGIN_TIME timestamp, 
	END_TIME timestamp, 
	CONSUME_TIME decimal(10,0) , 
	RECORD_TIME timestamp, 
	METHOD_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_method_trace_log modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_method_trace_log modify column URL_TRACE_LOG_ID VARCHAR(32) comment 'URL追踪日志ID';
   alter table ge_monitor_method_trace_log modify column METHOD_NAME VARCHAR(100) comment '方法名';
   alter table ge_monitor_method_trace_log modify column CLASS_NAME VARCHAR(200) comment '方法所属类名';
   alter table ge_monitor_method_trace_log modify column IN_PARAM longtext comment '方法输入参数';
   alter table ge_monitor_method_trace_log modify column OUT_PARAM longtext comment '方法输入参数';
   alter table ge_monitor_method_trace_log modify column BEGIN_TIME timestamp comment '方法开始时间';
   alter table ge_monitor_method_trace_log modify column END_TIME timestamp comment '方法结束时间';
   alter table ge_monitor_method_trace_log modify column CONSUME_TIME decimal(10,0) comment 'URL执行时间';
   alter table ge_monitor_method_trace_log modify column RECORD_TIME timestamp comment '日志记录时间';
   alter table ge_monitor_method_trace_log modify column METHOD_ID VARCHAR(32) comment '方法信息ID';
   alter table ge_monitor_method_trace_log comment '方法追踪日志信息表';



  CREATE TABLE ge_monitor_request_per_minute 
   (	
    ID VARCHAR(32), 
	APPLICATION_ID VARCHAR(32), 
    REQUEST_NUMBER decimal(10,0) , 
	RECORD_TIME timestamp
   ) ;

   alter table ge_monitor_request_per_minute modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_request_per_minute modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统ID';
   alter table ge_monitor_request_per_minute modify column REQUEST_NUMBER decimal(10,0) comment '请求数';
   alter table ge_monitor_request_per_minute modify column RECORD_TIME timestamp comment '记录时间';
   alter table ge_monitor_request_per_minute comment '应用系统每分钟请求数';


  CREATE TABLE ge_monitor_resources 
   (	
    RESOURCE_ID VARCHAR(32), 
	RESOURCE_NAME VARCHAR(300), 
	RESOURCE_TYPE VARCHAR(100) not null
   ) ;

   alter table ge_monitor_resources modify column RESOURCE_ID VARCHAR(32) comment '资源ID';
   alter table ge_monitor_resources modify column RESOURCE_NAME VARCHAR(300) comment '资源名称';
   alter table ge_monitor_resources modify column RESOURCE_TYPE VARCHAR(100) comment '资源类型';
   alter table ge_monitor_resources comment '资源表';


  CREATE TABLE ge_monitor_sms 
   (	
    ID VARCHAR(32), 
	APPID VARCHAR(50), 
	OWNER VARCHAR(100), 
	PHONENO VARCHAR(25), 
	CREATE_TIME timestamp, 
	STATUS VARCHAR(1), 
	REMARK VARCHAR(200)
   ) ;

   alter table ge_monitor_sms modify column ID VARCHAR(32) comment '序列';
   alter table ge_monitor_sms modify column APPID VARCHAR(50) comment '应用ID';
   alter table ge_monitor_sms modify column OWNER VARCHAR(100) comment '用户名';
   alter table ge_monitor_sms modify column PHONENO VARCHAR(25) comment '短信号码';
   alter table ge_monitor_sms modify column CREATE_TIME timestamp comment '创建时间';
   alter table ge_monitor_sms modify column STATUS VARCHAR(1) comment '短信状态';
   alter table ge_monitor_sms modify column REMARK VARCHAR(200) comment '备注';


  CREATE TABLE ge_monitor_threshold 
   (	
    ID VARCHAR(32), 
	NAME VARCHAR(100), 
	DESCRIPTION VARCHAR(250), 
	CRITICAL_THRESHOLD_CONDITION VARCHAR(2), 
	CRITICAL_THRESHOLD_VALUE decimal(10,0) , 
	CRITICAL_THRESHOLD_MESSAGE VARCHAR(250), 
	WARNING_THRESHOLD_CONDITION VARCHAR(2), 
	WARNING_THRESHOLD_VALUE decimal(10,0) , 
	WARNING_THRESHOLD_MESSAGE VARCHAR(250), 
	INFO_THRESHOLD_CONDITION VARCHAR(2), 
	INFO_THRESHOLD_VALUE decimal(10,0) , 
	INFO_THRESHOLD_MESSAGE VARCHAR(250)
   ) ;

   alter table ge_monitor_threshold modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_threshold modify column NAME VARCHAR(100) comment '名称';
   alter table ge_monitor_threshold modify column DESCRIPTION VARCHAR(250) comment '描述';
   alter table ge_monitor_threshold modify column CRITICAL_THRESHOLD_CONDITION VARCHAR(2) comment '临界阈值条件';
   alter table ge_monitor_threshold modify column CRITICAL_THRESHOLD_VALUE decimal(10,0) comment '临界阈值值';
   alter table ge_monitor_threshold modify column CRITICAL_THRESHOLD_MESSAGE VARCHAR(250) comment '临界阈值信息';
   alter table ge_monitor_threshold modify column WARNING_THRESHOLD_CONDITION VARCHAR(2) comment '警告阈值条件';
   alter table ge_monitor_threshold modify column WARNING_THRESHOLD_VALUE decimal(10,0) comment '警告阈值值';
   alter table ge_monitor_threshold modify column WARNING_THRESHOLD_MESSAGE VARCHAR(250) comment '警告阈值信息';
   alter table ge_monitor_threshold modify column INFO_THRESHOLD_CONDITION VARCHAR(2) comment '正常阈值条件';
   alter table ge_monitor_threshold modify column INFO_THRESHOLD_VALUE decimal(10,0) comment '正常阈值值';
   alter table ge_monitor_threshold modify column INFO_THRESHOLD_MESSAGE VARCHAR(250) comment '正常阈值信息';
   alter table ge_monitor_threshold comment '阈值信息表';


  CREATE TABLE ge_monitor_url 
   (	
    ID VARCHAR(32) not null, 
	DESCRIPTION VARCHAR(300), 
	URL VARCHAR(500) not null, 
	THRESHOLD decimal(6,0), 
	CREATE_TIME timestamp not null, 
	CREATOR_ID VARCHAR(32) not null, 
	MODIFY_TIME timestamp, 
	MODIFIER_ID VARCHAR(32), 
	STATUS VARCHAR(1) DEFAULT '1'
   ) ;

   alter table ge_monitor_url modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_url modify column DESCRIPTION VARCHAR(300) comment 'URL描述';
   alter table ge_monitor_url modify column URL VARCHAR(500) comment 'URL地址';
   alter table ge_monitor_url modify column THRESHOLD decimal(6,0) comment 'URL阈值，单位ms';
   alter table ge_monitor_url modify column CREATE_TIME timestamp comment '创建时间';
   alter table ge_monitor_url modify column CREATOR_ID VARCHAR(32) comment '创建人ID';
   alter table ge_monitor_url modify column MODIFY_TIME timestamp comment '修改时间';
   alter table ge_monitor_url modify column MODIFIER_ID VARCHAR(32) comment '修改人ID';
   alter table ge_monitor_url modify column STATUS VARCHAR(1) comment '有效状态:1有效,0删除';
   alter table ge_monitor_url comment '应用系统URL信息表';


  CREATE TABLE ge_monitor_url_method 
   (	
    URL_ID VARCHAR(32), 
	METHOD_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_url_method modify column URL_ID VARCHAR(32) comment 'URLID';
   alter table ge_monitor_url_method modify column METHOD_ID VARCHAR(32) comment '方法ID';
   alter table ge_monitor_url_method comment '应用系统URL方法信息表';


  CREATE TABLE ge_monitor_url_response_time 
   (	
    ID VARCHAR(32), 
	URL VARCHAR(300), 
	URL_ID VARCHAR(32), 
	MIN_RESPONSE_TIME decimal(10,0) , 
	MAX_RESPONSE_TIME decimal(10,0) , 
	TOTAL_RESPONSE_TIME decimal(10,0) , 
	RECORD_TIME timestamp, 
	APPLICATION_ID VARCHAR(32), 
	TOTAL_COUNT decimal(10,0) 
   ) ;

   alter table ge_monitor_url_response_time modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_url_response_time modify column URL VARCHAR(300) comment 'URL地址';
   alter table ge_monitor_url_response_time modify column URL_ID VARCHAR(32) comment 'URL信息ID';
   alter table ge_monitor_url_response_time modify column MIN_RESPONSE_TIME decimal(10,0) comment '最小响应时间';
   alter table ge_monitor_url_response_time modify column MAX_RESPONSE_TIME decimal(10,0) comment '最大响应时间';
   alter table ge_monitor_url_response_time modify column TOTAL_RESPONSE_TIME decimal(10,0) comment '总响应时间';
   alter table ge_monitor_url_response_time modify column RECORD_TIME timestamp comment '记录时间';
   alter table ge_monitor_url_response_time modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统';
   alter table ge_monitor_url_response_time modify column TOTAL_COUNT decimal(10,0) comment '总次数';
   alter table ge_monitor_url_response_time comment 'URL响应时间';


  CREATE TABLE ge_monitor_url_trace_log 
   (	
    ID VARCHAR(32) not null, 
	URL VARCHAR(500) not null, 
	URL_ID VARCHAR(32), 
	BIZ_SCENARIO_ID VARCHAR(32), 
	BEGIN_TIME timestamp, 
	END_TIME timestamp, 
	CONSUME_TIME decimal(10,0) , 
	SESSION_ID VARCHAR(100), 
	USER_ID VARCHAR(32), 
	USER_IP VARCHAR(100), 
	TRACE_ID VARCHAR(32), 
	REQUEST_PARAMS longtext, 
	ALARM_ID VARCHAR(32), 
	RECORD_TIME timestamp, 
	USERNAME VARCHAR(200), 
	APPLICATION_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_url_trace_log modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_url_trace_log modify column URL VARCHAR(500) comment 'URL地址';
   alter table ge_monitor_url_trace_log modify column URL_ID VARCHAR(32) comment 'URL信息ID';
   alter table ge_monitor_url_trace_log modify column BIZ_SCENARIO_ID VARCHAR(32) comment '所属业务场景ID';
   alter table ge_monitor_url_trace_log modify column BEGIN_TIME timestamp comment 'URL开始时间';
   alter table ge_monitor_url_trace_log modify column END_TIME timestamp comment 'URL结束时间';
   alter table ge_monitor_url_trace_log modify column CONSUME_TIME decimal(10,0) comment 'URL执行时间';
   alter table ge_monitor_url_trace_log modify column SESSION_ID VARCHAR(32) comment '会话ID';
   alter table ge_monitor_url_trace_log modify column USER_ID VARCHAR(32) comment '用户ID';
   alter table ge_monitor_url_trace_log modify column USER_IP VARCHAR(100) comment '用户IP';
   alter table ge_monitor_url_trace_log modify column TRACE_ID VARCHAR(32) comment '追踪ID';
   alter table ge_monitor_url_trace_log modify column REQUEST_PARAMS longtext comment '请求参数信息';
   alter table ge_monitor_url_trace_log modify column ALARM_ID VARCHAR(32) comment '告警信息ID';
   alter table ge_monitor_url_trace_log modify column RECORD_TIME timestamp comment '日志记录时间';
   alter table ge_monitor_url_trace_log modify column USERNAME VARCHAR(200) comment '用户名';
   alter table ge_monitor_url_trace_log modify column APPLICATION_ID VARCHAR(32) comment '应用系统ID';
   alter table ge_monitor_url_trace_log comment '记录应用系统URL追踪日志信息';


  CREATE TABLE ge_monitor_url_trace_log_temp 
   (	
    ID VARCHAR(32), 
	URL VARCHAR(500), 
	URL_ID VARCHAR(32), 
	BIZ_SCENARIO_ID VARCHAR(32), 
	BEGIN_TIME timestamp, 
	END_TIME timestamp, 
	CONSUME_TIME decimal(10,0) , 
	SESSION_ID VARCHAR(100), 
	USER_ID VARCHAR(32), 
	USER_IP VARCHAR(100), 
	TRACE_ID VARCHAR(32), 
	REQUEST_PARAMS longtext, 
	ALARM_ID VARCHAR(32), 
	RECORD_TIME timestamp, 
	USERNAME VARCHAR(200), 
	APPLICATION_ID VARCHAR(32)
   ) ;


  CREATE TABLE ge_monitor_url_visits_sta 
   (	
    ID VARCHAR(32), 
	URL_ID VARCHAR(32), 
	VISIT_NUMBER decimal(10,0) , 
	RECORD_TIME timestamp, 
	APPLICATION_ID VARCHAR(32)
   ) ;

   alter table ge_monitor_url_visits_sta modify column ID VARCHAR(32) comment '主键ID';
   alter table ge_monitor_url_visits_sta modify column URL_ID VARCHAR(32) comment 'URL信息ID';
   alter table ge_monitor_url_visits_sta modify column VISIT_NUMBER decimal(10,0)  comment '访问量';
   alter table ge_monitor_url_visits_sta modify column RECORD_TIME timestamp comment '记录时间';
   alter table ge_monitor_url_visits_sta modify column APPLICATION_ID VARCHAR(32) comment '所属应用系统ID';
   alter table ge_monitor_url_visits_sta comment '应用系统URL访问量统计';


  ALTER TABLE ge_monitor_account add primary key(ID);
  ALTER TABLE ge_monitor_account_auth add primary key(ID);
  ALTER TABLE ge_monitor_alarm add primary key(ID);
  ALTER TABLE ge_monitor_application add primary key(ID);
  ALTER TABLE ge_monitor_attribute add primary key(ID);
  ALTER TABLE ge_monitor_attribute_action add primary key(ID);
  ALTER TABLE ge_monitor_attribute_threshold add primary key(ID);
  ALTER TABLE ge_monitor_biz_scenario add primary key(ID);
  ALTER TABLE ge_monitor_email_action add primary key(ID);
  ALTER TABLE ge_monitor_eum_url add primary key(ID);
  ALTER TABLE ge_monitor_eum_url_ava add primary key(ID);
  ALTER TABLE ge_monitor_eum_url_ava_sta add primary key(ID);
  ALTER TABLE ge_monitor_exception_info add primary key(ID);
  ALTER TABLE ge_monitor_group add primary key(ID);
  ALTER TABLE ge_monitor_method add primary key(ID);
  ALTER TABLE ge_monitor_method_responsetime add primary key(ID);
  ALTER TABLE ge_monitor_method_tl_temp add primary key(ID);
  ALTER TABLE ge_monitor_method_trace_log add primary key(ID);
  ALTER TABLE ge_monitor_request_per_minute add primary key(ID);
  ALTER TABLE ge_monitor_resources add primary key(RESOURCE_ID);
  ALTER TABLE ge_monitor_sms add primary key(ID);
  ALTER TABLE ge_monitor_threshold add primary key(ID);
  ALTER TABLE ge_monitor_url add primary key(ID);
  ALTER TABLE ge_monitor_url_response_time add primary key(ID);
  ALTER TABLE ge_monitor_url_trace_log add primary key(ID);
  ALTER TABLE ge_monitor_url_trace_log_temp add primary key(ID);
  ALTER TABLE ge_monitor_url_visits_sta add primary key(ID);



  alter table ge_monitor_account_auth add foreign key FK_GE_MONIT_ACCOUNT_GE_MONIT (ACCOUNT_ID)
       references ge_monitor_account(ID);

  ALTER TABLE ge_monitor_biz_scenario ADD foreign key FK_BUSINESS_SCENARIO (APPLICATION_ID)
	  REFERENCES ge_monitor_application (ID);

  ALTER TABLE ge_monitor_biz_scenario_url ADD foreign key FK_BIZ_SCENARIO_URL_BIZ (BIZ_SCENARIO_ID)
	  REFERENCES ge_monitor_biz_scenario (ID);
	  
  ALTER TABLE ge_monitor_biz_scenario_url ADD foreign key FK_BIZ_SCENARIO_URL_URL (URL_ID)
	  REFERENCES ge_monitor_url (ID);

  ALTER TABLE ge_monitor_group_permission ADD foreign key FKAE243466DE3FB950 (GROUP_ID)
	  REFERENCES ge_monitor_group (ID);

  ALTER TABLE ge_monitor_url_method ADD foreign key FK_URL_METHOD_METHOD (METHOD_ID)
	  REFERENCES ge_monitor_method (ID);
	  
  ALTER TABLE ge_monitor_url_method ADD foreign key FK_URL_METHOD_URL (URL_ID)
	  REFERENCES ge_monitor_url (ID);




