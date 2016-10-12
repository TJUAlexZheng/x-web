package com.demo.biz.teacher;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.Category;
import com.demo.common.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Created by yanz on 2016/10/12.
 */
@Before(MenuInterceptors.class)
public class TeacherController extends Controller {

    public void index() {
        initMenus();
        List<User> teacherList;
        Map<String, List<User>> teachers = null;
        Function<User, String> groupStrategy = null;
        String sql = null;
        //查看杰出人才
        if (getParaToInt() == 29) {
            groupStrategy = User::award;
            sql = "select * from user where award_type is not null order by job_title desc, name";
            setAttr("strategy", "award");
        } else if (getParaToInt() == 25) {  //查看教师简介
            groupStrategy = User::laboratory;
            sql = "select * from user where laboratory is not null order by job_title desc, name";
            setAttr("strategy", "jobTitle");
        } else {
            redirect("/");
        }
        teacherList = User.dao.find(sql);
        teachers = teacherList.stream().collect(Collectors.groupingBy(groupStrategy));
        setAttr("teachers", teachers);
        render("award_list.ftl");
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
