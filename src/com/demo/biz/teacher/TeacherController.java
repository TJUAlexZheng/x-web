package com.demo.biz.teacher;

import com.demo.biz.interceptors.AuthInterceptor;
import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.biz.interceptors.SubMenuInterceptor;
import com.demo.biz.interceptors.TeacherAuthInterceptor;
import com.demo.common.model.User;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.StrKit;
import org.apache.commons.codec.digest.DigestUtils;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Created by yanz on 2016/10/12.
 */
@Before(MenuInterceptors.class)
public class TeacherController extends Controller {

	public static final String TEACHER_KEY = "teacher_key";

    @Before(SubMenuInterceptor.class)
	public void index() {
		List<User> teacherList;
		Map<String, List<User>> teachers = null;
		Function<User, String> groupStrategy = null;
		String sql = null;
		//查看杰出人才
		if (getParaToInt() == 29) {
			groupStrategy = User::award;
			sql = "select * from user where award_type is not null and verified = 1 order by job_title desc, name";
			setAttr("strategy", "award");
		} else if (getParaToInt() == 25) {  //查看教师简介
			groupStrategy = User::laboratory;
			sql = "select * from user where laboratory is not null and verified = 1 order by job_title desc, name";
			setAttr("strategy", "jobTitle");
		} else {
			redirect("/");
		}
		teacherList = User.dao.find(sql);
		teachers = teacherList.stream().collect(Collectors.groupingBy(groupStrategy));
		setAttr("teachers", teachers);
		render("award_list.ftl");
	}

    @Before(SubMenuInterceptor.class)
    public void detail(){
        User model = User.dao.findById(getParaToInt());
		model.setPassword("");
		model.setAccount("");
        if (model.getVerified() == 1) {
            setAttr("teacher",model);
			String imgBase64 = JsonKit.toJson(model.getImg());
			String imgSrc = "data:image/jpeg;base64," + imgBase64.substring(1, imgBase64.length() - 1);
			setAttr("photo", imgSrc);
			render("detail.ftl");
        }else {
            renderError(404);
        }
    }
	/**
	 * 老师个人详情页面
	 */
	@Before({TeacherAuthInterceptor.class, SessionInViewInterceptor.class})
	public void profile() {
		setAttr("teacher", getSessionAttr(TEACHER_KEY));
	}

    @Before({TeacherAuthInterceptor.class, SessionInViewInterceptor.class})
	public void getTeacher(){
        User model = getSessionAttr(TEACHER_KEY);
        model.setPassword("");
        renderJson(model);
    }
    @Before({TeacherAuthInterceptor.class, SessionInViewInterceptor.class})
	public void saveIntroduction(){
		String introduction = HttpKit.readData(getRequest());
		User model = getSessionAttr(TEACHER_KEY);
		model.setIntroduction(introduction);
		model.update();
		renderJson(introduction);
//
//		model.save();
//		renderJson(model);
	}

    @Before({TeacherAuthInterceptor.class, SessionInViewInterceptor.class})
	public void save() {
		User model = JsonKit.parse(HttpKit.readData(getRequest()), User.class);

		if (StrKit.notBlank(model.getPassword())) {
			model.setPassword(DigestUtils.md5Hex(model.getPassword()));
		} else {
			model.remove("password");
		}

		model.update();

		model.findById(model.getId());
		setSessionAttr(TEACHER_KEY, model);
		renderJson(model);
	}

	public void login() {
		//验证码
		if (!validateCaptcha("captcha")) {
			renderJson("verify", false);
			return;
		}
		//验证用户登陆是否成功
		Optional<User> teacher = Optional.ofNullable(User.dao.findFirst("select * from user where account = ? and password = md5(?)", getPara("user.account"), getPara("user.password")));
		if (teacher.isPresent()) {
			setSessionAttr(TEACHER_KEY, teacher.get());
			renderJson("verify", true);
		} else {
			renderJson("verify", false);
		}
	}

	/**
	 * ajax处理用户登出逻辑
	 */
//	@ActionKey("/logout")
	@Clear(AuthInterceptor.class)
	public void logout() {
		removeSessionAttr(TEACHER_KEY);
		redirect("/");
	}

}
