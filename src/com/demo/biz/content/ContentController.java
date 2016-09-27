package com.demo.biz.content;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.Category;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * Created by YanZ on 16/9/7.
 */
@Before(MenuInterceptors.class)
public class ContentController extends Controller {

    public void index(){
        Category hT = Category.dao.findById(getParaToInt());
        if (hT.getParentId() == null){
            setAttr("contentType", Category.dao.getFirstSubContentType(hT.getId()));
        }else {
            setAttr("contentType", hT);
        }
        while (hT.getParentId() != null){
            hT = Category.dao.findById(hT.getParentId());
        }
        setAttr("headType",hT);

        render("content.ftl");
    }
}
