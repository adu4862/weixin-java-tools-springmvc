package com.github.weixin.demo.dao;



import com.github.weixin.demo.domain.CourseBean;

import java.util.List;
import java.util.Map;

public interface CourseDao {
    List<Map<String, Object>> getCourseList(String sqlString);
    boolean updateCourse(String courseId, String sqlString);
    boolean insertCourse(CourseBean courseBean);
    boolean deleteCourse(String courseId);
}
