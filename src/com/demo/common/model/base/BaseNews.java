package com.demo.common.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseNews<M extends BaseNews<M>> extends Model<M> implements IBean {

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.String getTitle() {
		return get("title");
	}

	public void setTitle(java.lang.String title) {
		set("title", title);
	}

	public java.lang.String getContent() {
		return get("content");
	}

	public void setContent(java.lang.String content) {
		set("content", content);
	}

	public java.lang.Integer getType() {
		return get("type");
	}

	public void setType(java.lang.Integer type) {
		set("type", type);
	}

	public java.lang.Integer getVerified() {
		return get("verified");
	}

	public void setVerified(java.lang.Integer verified) {
		set("verified", verified);
	}

	public java.util.Date getCreatetime() {
		return get("createtime");
	}

	public void setCreatetime(java.util.Date createtime) {
		set("createtime", createtime);
	}

	public java.util.Date getUpdatetime() {
		return get("updatetime");
	}

	public void setUpdatetime(java.util.Date updatetime) {
		set("updatetime", updatetime);
	}

	public java.lang.String getImg() {
		return get("img");
	}

	public void setImg(java.lang.String img) {
		set("img", img);
	}

	public java.lang.Integer getTop() {
		return get("top");
	}

	public void setTop(java.lang.Integer top) {
		set("top", top);
	}

    public java.lang.String getAuthor() {
        return get("author");
    }

    public void setAuthor(java.lang.String author) {
        set("author", author);
    }

}
