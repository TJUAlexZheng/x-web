package com.demo.biz.page;

import com.demo.common.model.Blog;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.i18n.I18n;
import com.jfinal.i18n.Res;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheInterceptor;

import java.time.Instant;

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

    @ActionKey("/admin")
    public void admin() {
        render("/admin/index.ftl");
    }

    @ActionKey("/test")
    @Before({PageInterceptor.class, CacheInterceptor.class})
    public void test() {
//        Blog blogs = Blog.dao.findById(2);
        Page<Blog> blog = Blog.dao.paginate(1, 2, "select *", "from blog where title is not null");
        Res en_us = I18n.use("zh_CN");
        String msg = en_us.get("msg");
        String format = en_us.format("msg", "james", Instant.now());
        renderJson(format);
//        render("test.ftl");
    }

    private boolean isLogin() {
        return getSessionAttr(USER_KEY) != null;
    }
}
