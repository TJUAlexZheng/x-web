package com.demo.biz.page;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

/**
 * Created by yanz on 2016/8/22.
 */
public class PageController extends Controller {

    public static final String USER_KEY = "user";

    @ActionKey("/")
    public void index() {
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

    private boolean isLogin() {
        return getSessionAttr(USER_KEY) != null;
    }
}
