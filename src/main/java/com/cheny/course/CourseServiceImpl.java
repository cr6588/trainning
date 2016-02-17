package com.cheny.course;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cheny.course.CourseMapper;
import com.cheny.course.CourseService;
import com.cheny.web.bean.BigCourseType;
import com.cheny.web.bean.Course;
import com.cheny.web.bean.CourseHouseholdChild;
import com.cheny.web.bean.CourseType;
import com.cheny.web.bean.SmallCourseType;
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseMapper courseMapper;
    @Override
    public void addCourse(Course course) throws Exception {
        courseMapper.addCourse(course);
    }

    @Override
    public void updateCourse(Course course) throws Exception {
        courseMapper.updateCourse(course);
    }

    @Override
    public void deleteCourse(Integer id) throws Exception {
        courseMapper.deleteCourse(id);
    }

    @Override
    public Course getCourseById(Integer id) throws Exception {
        return courseMapper.getCourseById(id);
    }

    @Override
    public List<Course> getCourseByPage(Map<String, Object> param) throws Exception {
        return courseMapper.getCourseByPage(param);
    }

    @Override
    public Course getMaxIdCourse() throws Exception {
        return courseMapper.getMaxIdCourse();
    }

    @Override
    public Course getCourseByUsername(String username) throws Exception {
        return courseMapper.getCourseByUsername(username);
    }

    @Override
    public void updatePassword(Course course) throws Exception {
        courseMapper.updatePassword(course);
    }

    @Override
    public List<BigCourseType> getAllBigCourseType() throws Exception {
        return courseMapper.getAllBigCourseType();
    }

    @Override
    public List<CourseType> getCourseTypeByBigCourseTypeId(Integer bigCourseTypeId) throws Exception {
        return courseMapper.getCourseTypeByBigCourseTypeId(bigCourseTypeId);
    }

    @Override
    public List<SmallCourseType> getSmallCourseTypeByCourseTypeId(Integer courseTypeId) throws Exception {
        return courseMapper.getSmallCourseTypeByCourseTypeId(courseTypeId);
    }

    @Override
    public List<CourseHouseholdChild> getCourseHouseholdChildByPage(Map<String, Object> param) throws Exception {
        return courseMapper.getCourseHouseholdChildByPage(param);
    }

    @Override
    public CourseHouseholdChild getCourseHouseholdChildById(Integer id) throws Exception {
        return courseMapper.getCourseHouseholdChildById(id);
    }

    @Override
    public List<CourseHouseholdChild> getCourseHouseholdChildByCourseId(Integer id) throws Exception {
        return courseMapper.getCourseHouseholdChildByCourseId(id);
    }

}
