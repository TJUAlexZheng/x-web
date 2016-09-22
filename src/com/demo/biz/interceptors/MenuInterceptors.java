package com.demo.biz.interceptors;

import com.demo.common.model.ContentType;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

import java.util.List;

/**
 * Created by YanZ on 16/9/7.
 */
public class MenuInterceptors implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		List<ContentType> types = ContentType.dao.find("select * from content_type where parent_id is null");
		inv.getController().setAttr("types", types);
		inv.invoke();
	}
}
