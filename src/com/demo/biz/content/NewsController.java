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
 * Created by tjliqy on 2016/10/12.
 */
@Before(MenuInterceptors.class)
public class NewsController extends Controller{

    public void index(){
        News news = News.dao.findById(getParaToInt());
        setAttr("news", news);

        Category hT = Category.dao.findById(news.getType());//最外层的板块
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
        render("detail.ftl");
    }
}
