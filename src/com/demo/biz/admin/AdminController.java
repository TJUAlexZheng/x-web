package com.demo.biz.admin;

import com.demo.biz.interceptors.AuthInterceptor;
import com.demo.common.model.User;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;

import java.util.Optional;

/**
 * Created by YanZ on 16/9/30.
 */
@Before({AuthInterceptor.class, SessionInViewInterceptor.class})
public class AdminController extends Controller {

	public static final String USER_KEY = "user";

	/**
	 * 后台管理页面
	 */
	@Clear(AuthInterceptor.class)
	public void index() {
		if (isLogin()) {
			render("index.ftl");
		} else {
			render("login.ftl");
		}
	}

	/**
	 * ajax处理用户登陆验证逻辑
	 */
	@Clear(AuthInterceptor.class)
	public void login() {
		//验证码
		if (!validateCaptcha("captcha")) {
			renderJson("verify", false);
			return;
		}
		//验证用户登陆是否成功
		Optional<User> user = Optional.ofNullable(User.dao.findFirst("select * from user where account = ? and password = md5(?)", getPara("user.account"), getPara("user.password")));
		if (user.isPresent()) {
			setSessionAttr(USER_KEY, user.get());
			renderJson("verify", true);
		} else {
			renderJson("verify", false);
		}
	}

	/**
	 * ajax处理用户登出逻辑
	 */
//	@ActionKey("/logout")
	@Clear(AuthInterceptor.class)
	public void logout() {
		removeSessionAttr(USER_KEY);
		redirect("/admin");
	}


	/**
	 * 判断当前用户是否已经登陆
	 *
	 * @return true|false
	 */
	private boolean isLogin() {
		return getSessionAttr(USER_KEY) != null;
	}

}
