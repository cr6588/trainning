package com.cheny.web.bean;

public class CourseHouseholdChild {
    /**
     * course_household_child.id
     * @ibatorgenerated 2015-04-27 11:28:45
     */
    private Integer id;

    /**
     * course_household_child.add_time
     * @ibatorgenerated 2015-04-27 11:28:45
     */
    private String addTime;

    /**
     * course_household_child.course_id
     * @ibatorgenerated 2015-04-27 11:28:45
     */
    private Integer courseId;

    /**
     * course_household_child.household_id
     * @ibatorgenerated 2015-04-27 11:28:45
     */
    private Integer householdId;

    /**
     * course_household_child.child_id
     * @ibatorgenerated 2015-04-27 11:28:45
     */
    private Integer childId;

    private Household household;

    private Child child;

    private Course course;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getHouseholdId() {
        return householdId;
    }

    public void setHouseholdId(Integer householdId) {
        this.householdId = householdId;
    }

    public Integer getChildId() {
        return childId;
    }

    public void setChildId(Integer childId) {
        this.childId = childId;
    }

    public Household getHousehold() {
        return household;
    }

    public void setHousehold(Household household) {
        this.household = household;
    }

    public Child getChild() {
        return child;
    }

    public void setChild(Child child) {
        this.child = child;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
