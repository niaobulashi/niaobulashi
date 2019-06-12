package com.niaobulashi.common.utils;

/**
 * @program: niaobulashi
 * @description: 常量
 * @author: hulang
 * @create: 2019-06-10 13:57
 */
public class Constant {

    // 超级管理员用户ID
    public static final int SUPER_ADMIN = 1;

    // 超级管理员用户ID
    public static final String SQL_FILTER = "sql_filter";

    /**
     * 当前页码
     */
    public static final String PAGE = "page";
    /**
     * 每页显示记录数
     */
    public static final String LIMIT = "limit";
    /**
     * 排序字段
     */
    public static final String ORDER_FIELD = "sidx";
    /**
     * 排序方式
     */
    public static final String ORDER = "order";
    /**
     *  升序
     */
    public static final String ASC = "asc";

    /**
     * 菜单类型
     */
    public enum MenuType {
        /**
         * 目录
         */
        CATALOG(0),
        /**
         * 菜单
         */
        MENU(1),
        /**
         * 按钮
         */
        BUTTON(2);

        private int value;

        MenuType(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }


    /**
     * 删除标志
     */
    // 0-未删除
    public static final String CODE_DELETE_NO = "0";
    // 1-删除
    public static final String CODE_DELETE_YES = "1";

    /**
     * 用户状态
     */
    // 0-禁用
    public static final int CODE_USER_STATUS_LOCK = 0;
    // 1-正常
    public static final int CODE_USER_STATUS_UNLOCK = 1;
}

