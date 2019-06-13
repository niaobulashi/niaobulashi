package com.niaobulashi.controller;

import com.niaobulashi.annotation.Login;
import com.niaobulashi.annotation.LoginUser;
import com.niaobulashi.common.utils.ResponseVo;
import com.niaobulashi.entity.UserEntity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

/**
 * 测试接口
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/api")
@Api(tags="测试接口")
public class ApiTestController {

    @Login
    @GetMapping("userInfo")
    @ApiOperation(value="获取用户信息", response= UserEntity.class)
    public ResponseVo userInfo(@ApiIgnore @LoginUser UserEntity user){
        return ResponseVo.ok().put("user", user);
    }

    @Login
    @GetMapping("userId")
    @ApiOperation("获取用户ID")
    public ResponseVo userInfo(@ApiIgnore @RequestAttribute("userId") Integer userId){
        return ResponseVo.ok().put("userId", userId);
    }

    @GetMapping("notToken")
    @ApiOperation("忽略Token验证测试")
    public ResponseVo notToken(){
        return ResponseVo.ok().put("msg", "无需token也能访问。。。");
    }

}
