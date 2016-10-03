package com.demo.biz.page;

import com.demo.biz.interceptors.MenuInterceptors;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * Created by yanz on 2016/8/22.
 */
@Before(MenuInterceptors.class)
public class PageController extends Controller {


	/**
	 * 主页渲染逻辑
	 */
	@ActionKey("/")
	public void index() {
		render("index.ftl");
	}


	/**
	 * 渲染验证码
	 */
	@ActionKey("/captcha")
	public void captcha() {
		renderCaptcha();
	}

}
