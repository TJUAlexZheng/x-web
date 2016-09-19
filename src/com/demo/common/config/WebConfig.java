package com.demo.common.config;

import com.demo.biz.blog.BlogController;
import com.demo.biz.page.PageController;
import com.jfinal.config.*;
import com.jfinal.json.FastJsonFactory;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

/**
 * Created by yanz on 2016/8/20.
 */
public class WebConfig extends JFinalConfig {

    @Override
    public void configConstant(Constants me) {
        PropKit.use("db_config.properties");
        me.setViewType(ViewType.FREE_MARKER);
        me.setFreeMarkerViewExtension("ftl");
        me.setDevMode(PropKit.getBoolean("devMode", false));
        me.setJsonFactory(new FastJsonFactory());

        me.setI18nDefaultBaseName("i18n");
    }

    @Override
    public void configRoute(Routes me) {
        //页面渲染逻辑
        me.add("/", PageController.class, "/page");
        me.add("/blog", BlogController.class, "/front.blog");
    }

    @Override
    public void configPlugin(Plugins me) {
        // 配置druid数据库连接池插件
        DruidPlugin druidPlugin = new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
        //C3p0Plugin C3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
        me.add(druidPlugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
        me.add(arp);

        //配置Ehcache插件
        me.add(new EhCachePlugin());

        // 所有配置在 MappingKit 中搞定
//        _MappingKit.mapping(arp);
    }

    @Override
    public void configInterceptor(Interceptors me) {

    }

    @Override
    public void configHandler(Handlers me) {

    }
}
