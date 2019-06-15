package com.niaobulashi.modules.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.niaobulashi.common.utils.GenUtils;
import com.niaobulashi.common.utils.MyQuery;
import com.niaobulashi.common.utils.PageUtils;
import com.niaobulashi.modules.sys.dao.GeneratorDao;
import com.niaobulashi.modules.sys.service.SysGeneratorService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

/**
 * @program: niaobulashi
 * @description: 代码生成器
 * @author: hulang    hulang6666@qq.com
 * @create: 2019-06-15 16:19
 */
@Service
public class SysGeneratorServiceImpl implements SysGeneratorService {

    @Autowired
    private GeneratorDao generatorDao;

    @Override
    public PageUtils queryList(MyQuery myQuery) {
        Page<?> page = PageHelper.startPage(myQuery.getPage(), myQuery.getLimit());
        List<Map<String, Object>> list = generatorDao.queryList(myQuery);

        return new PageUtils(list, (int)page.getTotal(), myQuery.getLimit(), myQuery.getPage());
    }

    @Override
    public Map<String, String> queryTable(String tableName) {
        return generatorDao.queryTable(tableName);
    }

    @Override
    public List<Map<String, String>> queryColumns(String tableName) {
        return generatorDao.queryColumns(tableName);
    }

    @Override
    public byte[] generatorCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        try {

            for(String tableName : tableNames){
                //查询表信息
                Map<String, String> table = queryTable(tableName);
                //查询列信息
                List<Map<String, String>> columns = queryColumns(tableName);
                //生成代码
                GenUtils.generatorCode(table, columns, zip);
            }
            IOUtils.closeQuietly(zip);
            return outputStream.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
