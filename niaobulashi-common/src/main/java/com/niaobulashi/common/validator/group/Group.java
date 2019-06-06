package com.niaobulashi.common.validator.group;

import javax.validation.GroupSequence;

/**
 * @program: niaobulashi
 * @description: 定义校验顺序，如果AddGroup校验失败，则UpdateGroup则不会再校验
 * @author: hulang
 * @create: 2019-06-06 15:40
 */
@GroupSequence({AddGroup.class, UpdateGroup.class})
public interface Group {
}
