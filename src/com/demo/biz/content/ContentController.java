package com.demo.biz.content;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.Blog;
import com.demo.common.model.Category;
import com.demo.common.model.News;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

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
        Long i = cT.getType();
        if (i.equals(1L)) {
            Blog blog = Blog.dao.findFirst("select * from blog where type = ?", cT.getId());
            setAttr("detail", blog);

        } else if (i.equals(3L)) {
            int page;
            if (getParaToInt("page") == null) {
                page = 1;
            }else {
                page = getParaToInt("page");
            }
            Page<News> newsPage = News.dao.paginate(page, 15, "select *", "from news where type = ?", cT.getId());
//            List<News> newsList = News.dao.find("select * from news where type = ?", cT.getId());
            setAttr("detail", newsPage);

        }
        render("content.ftl");
    }
}
