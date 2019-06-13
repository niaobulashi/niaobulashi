package com.niaobulashi.modules.job.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @program: niaobulashi
 * @description: 测试定时任务(演示Demo，可删除)
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@Component("testTask")
public class TestTask implements ITask {
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void run(String params){
		logger.debug("TestTask定时任务正在执行，参数为：{}", params);
	}
}
