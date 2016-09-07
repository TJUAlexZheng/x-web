package com.demo.service;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * Created by yanz on 2016/9/6.
 */
public class OrderService {

    @Before(Tx.class)
    public void payment(int orderId, int userId) {

    }
}
