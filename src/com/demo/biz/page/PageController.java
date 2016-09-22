package com.demo.biz.page;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;

import java.util.Optional;

/**
 * Created by yanz on 2016/8/22.
 */
@Before(MenuInterceptors.class)
public class PageController extends Controller {

	public static final String USER_KEY = "user";

	/**
	 * 后台管理页面
	 */
	@ActionKey("/admin")
	@Before(SessionInViewInterceptor.class)
	public void admin() {
		if (isLogin()) {
			render("/admin/index.ftl");
		} else {
			render("/admin/login.ftl");
		}
	}

	/**
	 * ajax处理用户登陆验证逻辑
	 */
	@ActionKey("/login")
	public void login() {
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
	@ActionKey("/logout")
	public void logout() {
		removeSessionAttr(USER_KEY);
		redirect("/admin");
	}


	/**
	 * 主页渲染逻辑
	 */
	@ActionKey("/")
	public void index() {
		render("index.ftl");
	}


	@ActionKey("/captcha")
	public void captcha() {
		renderCaptcha();
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
