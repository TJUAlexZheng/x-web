package com.demo.common;

import com.demo.common.model.Blog;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import org.testng.annotations.BeforeMethod;

/**
 * Created by yanz on 2016/9/6.
 */
public class DBTest {
    @BeforeMethod
    public void setUp() throws Exception {
        PropKit.use("db_config.properties");

        DruidPlugin druidPlugin = new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());

        ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
        arp.addMapping("blog", Blog.class);

        EhCachePlugin ehCachePlugin = new EhCachePlugin();

        // 与web环境唯一的不同是要手动调用一次相关插件的start()方法
        druidPlugin.start();
        arp.start();
        ehCachePlugin.start();
    }
}
