package com.github.weixin.demo.dao;

import me.chanjar.weixin.mp.bean.result.WxMpUser;

public interface UserInfoDao {
    WxMpUser getUserInfo(String openId);
//    List<TbCourseEntity> searchMyOrder(String openId);
}
