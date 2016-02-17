package com.cheny.web.bean;

import java.util.List;

public class BigCourseType {

    private Integer id;

    private String bigCourseTypeName;

    private List<CourseType> courseTypeList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBigCourseTypeName() {
        return bigCourseTypeName;
    }

    public void setBigCourseTypeName(String bigCourseTypeName) {
        this.bigCourseTypeName = bigCourseTypeName;
    }

    public List<CourseType> getCourseTypeList() {
        return courseTypeList;
    }

    public void setCourseTypeList(List<CourseType> courseTypeList) {
        this.courseTypeList = courseTypeList;
    }

}
