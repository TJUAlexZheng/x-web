package com.demo.biz.blog;

import com.demo.common.model.Blog;
import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * Created by yanz on 2016/8/22.
 */
public class BlogValidator extends Validator {
    @Override
    protected void validate(Controller controller) {
        validateRequiredString("blog.title", "titleMsg", "请输入Blog标题!");
        validateRequiredString("blog.content", "contentMsg", "请输入Blog内容!");
    }

    @Override
    protected void handleError(Controller controller) {
        controller.keepModel(Blog.class);

        String actionKey = getActionKey();
        if (actionKey.equals("/blog/save"))
            controller.render("add.ftl");
        else if (actionKey.equals("/blog/update"))
            controller.render("edit.ftl");
    }
}
