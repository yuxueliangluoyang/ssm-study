package com.paic.ai.quartz;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.PersistJobDataAfterExecution;
import org.quartz.SchedulerException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.paic.ai.service.serviceImpl.SimpleService;


@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class MyQuartzJobBean1 extends QuartzJobBean{

    private static Logger log = Logger.getLogger(MyQuartzJobBean1.class);
    
    @Override
    protected void executeInternal(JobExecutionContext jobContext) throws JobExecutionException {
        // TODO Auto-generated method stub
        SimpleService simpleService = getApplicationContext(jobContext).getBean("simpleService",SimpleService.class);
        simpleService.testJob1();
    }

    private ApplicationContext getApplicationContext(final JobExecutionContext jobContext) {
        // TODO Auto-generated method stub
        try {
            return (ApplicationContext)jobContext.getScheduler().getContext().get("applicationContextKey");
        } catch (SchedulerException e) {
            log.error("jobContext.getScheduler().getContext() error!",e);
            throw new RuntimeException(e);
        }
    }

   

}
