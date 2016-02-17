package com.cheny.web.bean;


public class SmallCourseType {

    private Integer id;

    private Integer courseTypeId;

    private String smallCourseTypeName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public String getSmallCourseTypeName() {
        return smallCourseTypeName;
    }

    public void setSmallCourseTypeName(String smallCourseTypeName) {
        this.smallCourseTypeName = smallCourseTypeName;
    }
}