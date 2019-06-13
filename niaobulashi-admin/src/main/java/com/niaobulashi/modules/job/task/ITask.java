package com.niaobulashi.modules.job.task;

/**
 * @program: niaobulashi
 * @description: 定时任务接口，所有定时任务都要实现该接口
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
public interface ITask {

    /**
     * 执行定时任务接口
     *
     * @param params   参数，多参数使用JSON数据
     */
    void run(String params);
}