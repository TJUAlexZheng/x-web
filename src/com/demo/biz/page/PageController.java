package com.demo.biz.page;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.common.model.News;
import com.demo.common.model.RecommendedSite;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

import java.util.List;

/**
 * Created by yanz on 2016/8/22.
 */
@Before(MenuInterceptors.class)
public class PageController extends Controller {


	/**
	 * 主页渲染逻辑
	 */
	@ActionKey("/")
	public void index() {
		List<News> noticeNews = News.dao.find("select * from news where type = 83");
		if (noticeNews.size() > 3){
			noticeNews.subList(0,3);
		}
		setAttr("notice_news",noticeNews);
		List<News> predictNews = News.dao.find("select * from news where type = 86");
		if (predictNews.size() > 3){
			predictNews.subList(0,3);
		}
		setAttr("predict_news", predictNews);
		List<News> dynamicNews = News.dao.find("select * from news where type = 82");
		if (dynamicNews.size() > 7){
			dynamicNews.subList(0,7);
		}
		setAttr("dynamic_news", dynamicNews);
		List<RecommendedSite> recommendedSites = RecommendedSite.dao.find("select * from recommended_site");
		setAttr("recommended_site",RecommendedSite.dao.find("select * from recommended_site"));
		render("index.ftl");
	}


	/**
	 * 渲染验证码
	 */
	@ActionKey("/captcha")
	public void captcha() {
		renderCaptcha();
	}

}
