package com.demo.biz.index;

import com.jfinal.core.Controller;

/**
 * Created by yanz on 2016/8/22.
 */
public class IndexController extends Controller {

    public void index() {
        render("login.ftl");
    }
}
