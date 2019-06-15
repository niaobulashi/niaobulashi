package com.niaobulashi.common.utils;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 自定义查询参数
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-15 16:33
 */
public class MyQuery extends LinkedHashMap<String, Object> {
    private static final long serialVersionUID = 1L;
    //当前页码
    private int page;
    //每页条数
    private int limit;

    public MyQuery(Map<String, Object> params){
        this.putAll(params);

        //分页参数
        this.page = Integer.parseInt(params.get("page").toString());
        this.limit = Integer.parseInt(params.get("limit").toString());
        this.put("offset", (page - 1) * limit);
        this.put("page", page);
        this.put("limit", limit);
    }


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
