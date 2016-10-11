package com.demo.biz.content;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.Blog;
import com.demo.common.model.Category;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * Created by YanZ on 16/9/7.
 */
@Before(MenuInterceptors.class)
public class ContentController extends Controller {

    public void index(){
        Category hT = Category.dao.findById(getParaToInt());//最外层的板块
        Category cT;//当前板块
        if (hT.getParentId() == null){
            cT = Category.dao.getFirstSubContentType(hT.getId());
        }else {
            cT = hT;
        }
        setAttr("contentType",cT);
        while (hT.getParentId() != null){
            hT = Category.dao.findById(hT.getParentId());
        }
        setAttr("headType",hT);

        Blog blog =Blog.dao.findFirst("select * from blog where type = ?", cT.getId());
        setAttr("blog",blog);

        render("content.ftl");
    }
}
