package com.demo.biz.content;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.ContentType;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

import java.util.List;

/**
 * Created by YanZ on 16/9/7.
 */
@Before(MenuInterceptors.class)
public class ContentController extends Controller {

    public void index(){
        ContentType hT = ContentType.dao.findById(getParaToInt());
        if (hT.getParentId() == null){
            setAttr("contentType", ContentType.dao.getFirstSubContentType(hT.getId()));
        }else {
            setAttr("contentType", hT);
        }
        while (hT.getParentId() != null){
            hT = ContentType.dao.findById(hT.getParentId());
        }
        setAttr("headType",hT);

        render("content.ftl");
    }
    @ActionKey("/edit")
    public void edit(){
        render("edit.ftl");

    }
}
