package com.demo.biz.content;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.Blog;
import com.demo.common.model.Category;
import com.demo.common.model.News;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

@Before(MenuInterceptors.class)
public class NewsController extends Controller{

    public void index(){
        News news = News.dao.findById(getParaToInt());
        if (news.getVerified() == 1){
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
        }else {
            renderError(404);
        }

    }
}
