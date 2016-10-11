package com.demo.biz.admin;

import com.demo.biz.builders.DataTable;
import com.demo.common.model.Blog;
import com.demo.common.model.Category;
import com.demo.common.model.News;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.kit.HttpKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.demo.biz.admin.AdminController.USER_PRIVILEGES_KEY;

/**
 * Created by tjliqy on 2016/10/10.
 */
@Before({SessionInViewInterceptor.class})
public class NewsController extends Controller {
    public void index() {
        render("news.ftl");
    }

    public void list() {
        //解析页面传递参数，构建dataTables参数
        DataTable params = DataTable.build(this);

        //模糊查询
        StringBuilder sb = new StringBuilder("from news where 1=1 ");
        List<String> selectParams = new ArrayList<>();
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
        Page<News> newsList = News.dao.paginate(params.getPageNumber(), params.getPageSize(), "select *", sb.toString(), selectParams.toArray());
        renderJson(newsList);
    }

    public void save() {
        News model = JsonKit.parse(HttpKit.readData(getRequest()), News.class);
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
            News.dao.deleteById(getParaToInt("id"));
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
        News news = News.dao.findById(id);
        if (news == null) {
            getResponse().setStatus(500);
            renderJson();
            return;
        }
        renderJson(news);
    }

    //打开查看新闻详情页面
    public void content() {
        setAttr("id", getPara("id"));
        render("ueeditor.ftl");
    }

    //审核新闻
    public void verified() {
        Integer id = getParaToInt("id");
        Db.update("update news set verified = 1 where id = ?", id);
        renderJson();
    }

    public void categories() {
        List<Category> categories;
        categories = Category.dao.find("select id, name from category where parent_id is not null and type = 3");
        renderJson(categories);
    }
}
