package com.demo.common.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

    public static void mapping(ActiveRecordPlugin arp) {
        arp.addMapping("admin", "id", Admin.class);
        arp.addMapping("admin_privileges", "user_id", AdminPrivileges.class);
        arp.addMapping("blog", "id", Blog.class);
        arp.addMapping("category", "id", Category.class);
        arp.addMapping("email", "id", Email.class);
        arp.addMapping("news", "id", News.class);
        arp.addMapping("recommended_site", "id", RecommendedSite.class);
        arp.addMapping("user", "id", User.class);
    }
}

