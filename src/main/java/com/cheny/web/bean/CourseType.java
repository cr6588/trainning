package com.cheny.web.bean;

import java.util.List;


public class CourseType {

    private Integer id;

    private String courseTypeName;

    private Integer bigCourseTypeId;

    private List<SmallCourseType> smallCourseTypeList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseTypeName() {
        return courseTypeName;
    }

    public void setCourseTypeName(String courseTypeName) {
        this.courseTypeName = courseTypeName;
    }

    public Integer getBigCourseTypeId() {
        return bigCourseTypeId;
    }

    public List<SmallCourseType> getSmallCourseTypeList() {
        return smallCourseTypeList;
    }

    public void setSmallCourseTypeList(List<SmallCourseType> smallCourseTypeList) {
        this.smallCourseTypeList = smallCourseTypeList;
    }

    public void setBigCourseTypeId(Integer bigCourseTypeId) {
        this.bigCourseTypeId = bigCourseTypeId;
    }
}