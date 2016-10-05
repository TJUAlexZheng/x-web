package com.demo.biz.admin;

import com.demo.biz.builders.DataTable;
import com.demo.common.model.Blog;
import com.demo.common.model.Category;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by YanZ on 16/10/3.
 */
@Before({SessionInViewInterceptor.class})
public class BlogController extends Controller {

	public void index() {
		render("blog.ftl");
	}

	public void list() {
		//解析页面传递参数，构建dataTables参数
		DataTable params = DataTable.build(this);

		//模糊查询
		StringBuilder sb = new StringBuilder("from blog where 1=1 ");
		List selectParams = new ArrayList();
		if (StrKit.notBlank(params.getSearchValue())) {
			sb.append("and title like ?");
			String value = "%" + params.getSearchValue() + "%";
			selectParams.add(value);
		}
		if (StrKit.notBlank(getPara("columns[3][search][value]"))) {
			sb.append("and type = ?");
			selectParams.add(getPara("columns[3][search][value]"));
		}
		sb.append("order by " + params.getOrderColumn() + " " + params.getOrderDirection());
		Page<Blog> blogList = Blog.dao.paginate(params.getPageNumber(), params.getPageSize(), "select *", sb.toString(), selectParams.toArray());
		renderJson(blogList);
	}

	public void save() {
		Blog model = JsonKit.parse(HttpKit.readData(getRequest()), Blog.class);
		if (model.getId() != null) {
			model.remove("createtime", "updatetime");
			model.update();
			model = model.findById(model.getId());
		} else {
			model.save();
		}
		renderJson(model);
	}

	public void delete() {
		try {
			Blog.dao.deleteById(getParaToInt("id"));
		} catch (Exception e) {
			getResponse().setStatus(500);
		}
		renderJson();
	}

	//查看新闻详细内容
	public void detail() {
		Integer id = getParaToInt("id");
		if (id == null) {
			getResponse().setStatus(500);
			return;
		}
		Blog blog = Blog.dao.findById(id);
		if (blog == null) {
			getResponse().setStatus(500);
			return;
		}
		renderJson(blog);
	}

	//打开查看新闻详情页面
	public void content() {
		setAttr("id", getPara("id"));
		render("ueeditor.ftl");
	}

	public void verified() {
		Integer id = getParaToInt("id");
		// TODO: 16/10/5 blog审核通过 更新数据库
	}

	public void categories() {
		String id = getPara("id");
		List<Category> categories;
		if (id != null) {
			categories = Category.dao.find("select id, name from category where parent_id = ?", id);
		} else {
			categories = Category.dao.find("select id, name from category where parent_id is null");
		}
		renderJson(categories);
	}
}
