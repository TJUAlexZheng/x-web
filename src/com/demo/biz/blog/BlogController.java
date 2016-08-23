package com.demo.biz.blog;

import com.demo.common.model.Blog;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * Created by yanz on 2016/8/22.
 */


public class BlogController extends Controller {

    public void index() {
        setAttr("blogPage", Blog.dao.paginate(getParaToInt(0, 1), 10));
        render("blog.ftl");
    }

    @Before(BlogValidator.class)
    public void save() {
        getModel(Blog.class).save();
        redirect("/blog");
    }

    public void edit() {
        setAttr("blog", Blog.dao.findById(getParaToInt()));
    }

    @Before(BlogValidator.class)
    public void update() {
        getModel(Blog.class).update();
        redirect("/blog");
    }

    public void delete() {
        Blog.dao.deleteById(getParaToInt());
        redirect("/blog");
    }
}
