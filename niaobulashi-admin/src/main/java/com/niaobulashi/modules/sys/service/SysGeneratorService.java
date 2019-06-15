package com.niaobulashi.modules.sys.service;

import com.niaobulashi.common.utils.MyQuery;
import com.niaobulashi.common.utils.PageUtils;

import java.util.List;
import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 代码生成器
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
public interface SysGeneratorService {

	// 列表查询
	public PageUtils queryList(MyQuery myQuery);

	public Map<String, String> queryTable(String tableName);

	public List<Map<String, String>> queryColumns(String tableName);

	public byte[] generatorCode(String[] tableNames);
}
