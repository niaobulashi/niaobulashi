package com.niaobulashi.dao;

import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 数据库接口
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
public interface GeneratorDao {
    List<Map<String, Object>> queryList(Map<String, Object> map);

    Map<String, String> queryTable(String tableName);

    List<Map<String, String>> queryColumns(String tableName);
}
