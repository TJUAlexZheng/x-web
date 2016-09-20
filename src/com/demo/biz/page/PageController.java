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

    public static final String USER_KEY = "user";

    /**
     * 后台管理页面
     */
    @ActionKey("/admin")
    public void admin() {
        String requestAction = getPara(0, "");
        switch (requestAction) {
            //处理登录逻辑
            case "login":
                if (isLogin()) {
                    render("index.ftl");
                } else {
                    setSessionAttr(USER_KEY, "zhengyan");
                    redirect("/");
                }
                break;
            //处理登出逻辑
            case "logout":
                removeSessionAttr(USER_KEY);
                redirect("/");
                break;
            //处理其他逻辑
            default:
                render(isLogin() ? "index.ftl" : "login.ftl");
        }
    }

    /**
     * 主页渲染逻辑
     */
    @ActionKey("/")
    public void index() {
        render("index.ftl");
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
