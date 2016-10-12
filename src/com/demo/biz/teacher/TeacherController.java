package com.demo.biz.teacher;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.Category;
import com.demo.common.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by yanz on 2016/10/12.
 */
@Before(MenuInterceptors.class)
public class TeacherController extends Controller {

    public void index() {
        initMenus();
        List<User> teacherList = User.dao.find("select * from user where award_type is not null");
        Map<String, List<User>> teachers = teacherList.stream().collect(Collectors.groupingBy(User::award));
        setAttr("teachers", teachers);
        render("award_list.ftl");
    }

    public void list() {
        initMenus();
        List<User> teacherList = User.dao.find("select * from user");
        setAttr("teachers", teacherList);

        render("teacher_list.ftl");
    }

    private void initMenus() {
        Category hT = Category.dao.findById(getParaToInt());//最外层的板块
        Category cT;//当前板块
        if (hT.getParentId() == null) {
            cT = Category.dao.getFirstSubContentType(hT.getId());
        } else {
            cT = hT;
        }
        setAttr("contentType", cT);
        while (hT.getParentId() != null) {
            hT = Category.dao.findById(hT.getParentId());
        }
        setAttr("headType", hT);
    }


}
