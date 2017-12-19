package com.ctsig.mobilescm.listener;

import com.ctsig.mobilescm.service.inter.system.LogService;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 系统初始化 日志处理
 */
@Component
public class SystemInit {
    private final org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private LogService logService;

    //    每月15日上午10:15触发:从0开始每15天 *标识月
    @Scheduled(cron = "0 15 10 15 * ?")
    public void bootLog() {
        logger.info("--开启日志删除--" + new Date());
        //设置每15天删除日志
        final long period = 15 * 24 * 60 * 60 * 1000;
        //创建定时器
        Date date = new Date(new Date().getTime() - period);
        logService.deleteLog(date);
    }

}
