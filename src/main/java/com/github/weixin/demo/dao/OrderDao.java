package com.github.weixin.demo.dao;




import com.github.weixin.demo.domain.OrderBean;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    List<Map<String, Object>> getOrderList(String sqlString);
    boolean updateOrder(String courseId, String sqlString);
    boolean insertOrder(OrderBean courseBean);
    boolean deleteOrder(String courseId);
}
