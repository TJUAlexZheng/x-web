package com.demo.common.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseContentType<M extends BaseContentType<M>> extends Model<M> implements IBean {

    public java.lang.Long getId() {
        return get("id");
    }

    public void setId(java.lang.Long id) {
        set("id", id);
    }

    public java.lang.String getName() {
        return get("name");
    }

    public void setName(java.lang.String name) {
        set("name", name);
    }

    public java.lang.Integer getParentId() {
        return get("parent_id");
    }

    public void setParentId(java.lang.Integer parentId) {
        set("parent_id", parentId);
    }

}
