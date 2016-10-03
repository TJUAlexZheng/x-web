package com.demo.biz.admin;

import com.demo.biz.builders.DataTable;
import com.demo.common.model.User;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Created by YanZ on 16/9/30.
 */
@Before(SessionInViewInterceptor.class)
public class TeacherController extends Controller {

	public void index() {
		User.dao.paginate(1, 10);
		List<User> users = User.dao.find("select * from user");
		setAttr("users", users);
		render("teacher.ftl");
	}

	public void list() {
		//解析页面传递参数，构建dataTables参数
		DataTable params = DataTable.build(this);

		//模糊查询
		String whereClause = "";
		if (StrKit.notBlank(params.getSearchValue())) {
			whereClause = String.format("where id like '%%%1$s%%' or account like '%%%1$s%%' or name like '%%%1$s%%' ", params.getSearchValue());
		}
		String sqlExceptSelect = String.format("from user %s order by %s %s", whereClause, params.getOrderColumn(), params.getOrderDirection());
		Page<User> userList = User.dao.paginate(params.getPageNumber(), params.getPageSize(),
				"select *", sqlExceptSelect);
		renderJson(userList);
	}

	public void form() {
		render("form.ftl");
	}
}
