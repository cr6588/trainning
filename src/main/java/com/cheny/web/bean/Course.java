package com.cheny.web.bean;

import java.math.BigDecimal;

public class Course extends Common {
    /**
     * course.big_course_type_id (课程大类id)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer bigCourseTypeId;

    private BigCourseType bigCourseType;
    /**
     * course.course_type_id (课程类别id)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer courseTypeId;

    private CourseType courseType;
    /**
     * course.small_course_type_id (课程小类id)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer smallCourseTypeId;

    private SmallCourseType smallCourseType;
    /**
     * course.title (标题)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String title;

    /**
     * course.family_education_experience (家教经验)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String familyEducationExperience;

    /**
     * course.hourly_rate_start (时薪（起）)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private BigDecimal hourlyRateStart;

    /**
     * course.hourly_rate_end (时薪（止）)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private BigDecimal hourlyRateEnd;

    /**
     * course.course_envirment (课程环境附件路径)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String courseEnvirment;

    /**
     * course.people_num_start (授课人数（起）)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer peopleNumStart;

    /**
     * course.people_num_end (授课人数（止）)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer peopleNumEnd;

    /**
     * course.object (对象)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String object;

    /**
     * course.special (专项)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String special;

    /**
     * course.class_type (形式(班级类别))
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String classType;

    /**
     * course.sheng (省)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String sheng;

    /**
     * course.shi (市)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String shi;

    /**
     * course.xian (县（复选框时含有多个）)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String xian;

    /**
     * course.detail_address (详细地址输入框)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String detailAddress;

    /**
     * course.course_status (课程状态（是否被禁）)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer courseStatus;

    /**
     * course.admin_id (禁止的管理人员id)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer adminId;

    /**
     * course.reason (禁止原因)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private String reason;

    /**
     * course.teacher_id (教师id)
     * @ibatorgenerated 2015-04-16 15:16:31
     */
    private Integer teacherId;
    /**
     * 教师类，用于页面显示数据
     */
    private Teacher teacher;
    /**
     * 详细说明
     */
    private String detailExplain;
    /**
     * 统计人数
     */
    private Integer personNum;

    public Course (){
        
    }

    public Course (Integer id, Integer courseStatus, String reason){
        super.setId(id);
        this.courseStatus = courseStatus;
        this.reason = reason;
    }

    public Integer getBigCourseTypeId() {
        return bigCourseTypeId;
    }

    public void setBigCourseTypeId(Integer bigCourseTypeId) {
        this.bigCourseTypeId = bigCourseTypeId;
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public Integer getSmallCourseTypeId() {
        return smallCourseTypeId;
    }

    public void setSmallCourseTypeId(Integer smallCourseTypeId) {
        this.smallCourseTypeId = smallCourseTypeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFamilyEducationExperience() {
        return familyEducationExperience;
    }

    public void setFamilyEducationExperience(String familyEducationExperience) {
        this.familyEducationExperience = familyEducationExperience;
    }

    public BigDecimal getHourlyRateStart() {
        return hourlyRateStart;
    }

    public void setHourlyRateStart(BigDecimal hourlyRateStart) {
        this.hourlyRateStart = hourlyRateStart;
    }

    public BigDecimal getHourlyRateEnd() {
        return hourlyRateEnd;
    }

    public void setHourlyRateEnd(BigDecimal hourlyRateEnd) {
        this.hourlyRateEnd = hourlyRateEnd;
    }

    public String getCourseEnvirment() {
        return courseEnvirment;
    }

    public void setCourseEnvirment(String courseEnvirment) {
        this.courseEnvirment = courseEnvirment;
    }

    public Integer getPeopleNumStart() {
        return peopleNumStart;
    }

    public void setPeopleNumStart(Integer peopleNumStart) {
        this.peopleNumStart = peopleNumStart;
    }

    public Integer getPeopleNumEnd() {
        return peopleNumEnd;
    }

    public void setPeopleNumEnd(Integer peopleNumEnd) {
        this.peopleNumEnd = peopleNumEnd;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }

    public String getSpecial() {
        return special;
    }

    public void setSpecial(String special) {
        this.special = special;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public String getSheng() {
        return sheng;
    }

    public void setSheng(String sheng) {
        this.sheng = sheng;
    }

    public String getShi() {
        return shi;
    }

    public void setShi(String shi) {
        this.shi = shi;
    }

    public String getXian() {
        return xian;
    }

    public void setXian(String xian) {
        this.xian = xian;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public Integer getCourseStatus() {
        return courseStatus;
    }

    public void setCourseStatus(Integer courseStatus) {
        this.courseStatus = courseStatus;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getDetailExplain() {
        return detailExplain;
    }

    public void setDetailExplain(String detailExplain) {
        this.detailExplain = detailExplain;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public BigCourseType getBigCourseType() {
        return bigCourseType;
    }

    public void setBigCourseType(BigCourseType bigCourseType) {
        this.bigCourseType = bigCourseType;
    }

    public CourseType getCourseType() {
        return courseType;
    }

    public void setCourseType(CourseType courseType) {
        this.courseType = courseType;
    }

    public SmallCourseType getSmallCourseType() {
        return smallCourseType;
    }

    public void setSmallCourseType(SmallCourseType smallCourseType) {
        this.smallCourseType = smallCourseType;
    }

    public Integer getPersonNum() {
        return personNum;
    }

    public void setPersonNum(Integer personNum) {
        this.personNum = personNum;
    }

}