package com.cheny.course;

import java.util.List;
import java.util.Map;

import com.cheny.web.bean.BigCourseType;
import com.cheny.web.bean.Course;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.CourseType;
import com.cheny.web.bean.SmallCourseType;

public interface CourseMapper {

    public void addCourse(Course course) throws Exception;

    public void updateCourse(Course course) throws Exception;

    public void deleteCourse(Integer id) throws Exception;

    public Course getCourseById(Integer id) throws Exception;

    public List<Course> getCourseByPage(Map<String, Object> param) throws Exception;

    public Course getMaxIdCourse() throws Exception;

    public Course getCourseByUsername(String username) throws Exception;

    public void updatePassword(Course course) throws Exception;

    public List<BigCourseType> getAllBigCourseType() throws Exception;

    public List<CourseType> getCourseTypeByBigCourseTypeId(Integer bigCourseTypeId) throws Exception;

    public List<SmallCourseType> getSmallCourseTypeByCourseTypeId(Integer courseTypeId) throws Exception;

    public List<CourseHouseholdChild> getCourseHouseholdChildByPage(Map<String, Object> param)throws Exception;

    public CourseHouseholdChild getCourseHouseholdChildById(Integer id) throws Exception;

    public List<CourseHouseholdChild> getCourseHouseholdChildByCourseId(Integer id)throws Exception;
}
