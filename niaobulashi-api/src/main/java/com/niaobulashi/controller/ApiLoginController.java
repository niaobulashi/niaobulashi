package com.niaobulashi.controller;

import com.niaobulashi.annotation.Login;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.common.validator.ValidatorUtils;
import com.niaobulashi.form.LoginForm;
import com.niaobulashi.service.TokenService;
import com.niaobulashi.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;

/**
 * @program: niaobulashi
 * @description: 登录接口
 * @author: hulang
 * @create: 2019-06-12 19:38
 */
@RestController
@RequestMapping("/api")
@Api(tags="登录接口")
public class ApiLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;


    @PostMapping("login")
    @ApiOperation("登录")
    public ResponseVo login(@RequestBody LoginForm form){
        //表单校验
        ValidatorUtils.validateEntity(form);

        //用户登录
        Map<String, Object> map = userService.login(form);

        return ResponseVo.ok(map);
    }

    @Login
    @PostMapping("logout")
    @ApiOperation("退出")
    public ResponseVo logout(@ApiIgnore @RequestAttribute("userId") long userId){
        tokenService.expireToken(userId);
        return ResponseVo.ok();
    }

}
