package com.demo.biz.page;

import com.demo.common.DBTest;
import com.demo.common.model.Blog;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.util.List;

/**
 * Created by yanz on 2016/9/6.
 */
public class PageControllerTest extends DBTest {


    @Test
    public void testTest1() throws Exception {
        List<Blog> blogs = Blog.dao.find("select * from blog");
        System.out.println(blogs);
        Assert.assertNotNull(blogs);
    }

}