package com.demo.biz.page;

import com.demo.biz.interceptors.MenuInterceptors;
import com.demo.biz.interceptors.SubMenuInterceptor;
import com.demo.common.model.Category;
import com.demo.common.model.News;
import com.demo.common.model.RecommendedSite;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yanz on 2016/8/22.
 */
@Before(MenuInterceptors.class)
public class PageController extends Controller {

    private static final int TYPE_NOTICE_NEWS = 83;
    private static final int TYPE_PREDICT_NEWS = 86;
    private static final int TYPE_DYNAMIC_NEWS = 82;

    /**
     * 主页渲染逻辑
     */
    @ActionKey("/")
    public void index() {
        List<News> newsOnBanner = getNews(TYPE_DYNAMIC_NEWS, 5, true);
        setAttr("banner_news", newsOnBanner);
        List<News> noticeNews = getNews(TYPE_NOTICE_NEWS, 3, false);
        setAttr("notice_news", noticeNews);
        List<News> predictNews = getNews(TYPE_PREDICT_NEWS, 2, false);
        setAttr("predict_news", predictNews);
        List<News> dynamicNews = getNews(TYPE_DYNAMIC_NEWS, 7, false);
        setAttr("dynamic_news", dynamicNews);
        setAttr("recommended_site", RecommendedSite.dao.find("select * from recommended_site"));
        render("index.ftl");
    }

    private List<News> getNews(int type, int size, boolean needImg) {
        List<News> newsList = new ArrayList<>();
        if (!needImg) {
            newsList = News.dao.find("select * from news where type = ? and top = ? and verified = 1", type, 1);
            if (newsList.size() < size) {
                newsList.addAll(News.dao.find("select * from news where type = ? and top = ? and verified = 1", type, 0));
            }
        }else {
            newsList = News.dao.find("select * from news where type = ? and top = ? and img is not null and verified = 1", type, 1);
            if (newsList.size() < size) {
                newsList.addAll(News.dao.find("select * from news where type = ? and top = ? and img is not null and verified = 1", type, 0));
            }
        }
        if (newsList.size() > size) {
            newsList = newsList.subList(0, size);
        }
        return newsList;
    }

    /**
     * 渲染验证码
     */
    @ActionKey("/captcha")
    public void captcha() {
        renderCaptcha();
    }

    @ActionKey("/organization")
    @Before({MenuInterceptors.class, SubMenuInterceptor.class})
    public void organization() {
        render("/front/content/organization.ftl");
    }


}
