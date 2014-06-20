package com.sinosoft.one.monitor.application.repository;
// Generated 2013-2-27 18:41:37 by One Data Tools 1.0.0

import com.sinosoft.one.data.jade.annotation.SQL;
import com.sinosoft.one.monitor.application.model.Url;
import com.sinosoft.one.mvc.web.annotation.Param;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface UrlRepository extends PagingAndSortingRepository<Url, String> {

	List<Url> findByStatus(String status);

    Url findByUrl(String urlAddress);

    @SQL("select * from ge_monitor_url a where a.ID in (select b.url_id from ge_monitor_biz_scenario_url b right join ge_monitor_biz_scenario c on b.BIZ_SCENARIO_ID=?1)")
    List<Url> selectUrlsOfBizScenarioByIds(@Param("bizScenarioId") String bizScenarioId);

    @SQL("select * from ge_monitor_url a where a.ID in (\n" +
            "       select b.url_id \n" +
            "         from ge_monitor_biz_scenario_url b , \n" +
            "              ge_monitor_biz_scenario c \n" +
            "        where c.application_id=?1 \n" +
            "          and c.id=b.biz_scenario_id)")
    List<Url> findUrlByAppID(String applicationId);

    @SQL("update ge_monitor_url a set a.URL=?2,a.DESCRIPTION=?3,a.MODIFIER_ID=?4,a.MODIFY_TIME=sysdate where a.ID=?1")
    void updateUrl(String urlId, String url, String description,String modifierId);

    @SQL("delete ge_monitor_biz_scenario_url a where a.BIZ_SCENARIO_ID=?1 and a.URL_ID=?2")
    void deleteBizScenarioAndUrl(String bizScenarioId,String urlId);

    @SQL("select a.BIZ_SCENARIO_ID from ge_monitor_biz_scenario_url a where a.URL_ID=?1")
    List<String> selectUrlsWithUrlId(String urlId);

    @SQL("delete ge_monitor_url_method a where a.URL_ID=?1")
    void deleteUrlAndMethod(String urlId);

    @SQL("delete ge_monitor_biz_scenario_url a where a.BIZ_SCENARIO_ID=?1 and a.URL_ID in (?2)")
    void batchDeleteBizScenarioAndUrl(String bizScenarioId, String[] urlIds);

    @SQL("delete ge_monitor_url_method a where a.URL_ID in (?1)")
    void batchDeleteUrlAndMethod(String[] urlIds);

    @SQL("delete ge_monitor_url a where a.ID in (?1)")
    void batchDelete(String[] ids);
    
    @SQL("select * from ge_monitor_url a where a.ID =?1")
    Url findUrlByID(String id);

}

