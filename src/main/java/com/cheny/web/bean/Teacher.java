package com.cheny.web.bean;

public class Teacher extends Common {

    private String username;

    private String password;

    private String name;

    private String sex;

    private String birthday;

    private String phone;

    private String idCardNo;

    private String idCardAttache;

    private Integer status;

    private String failReason;

    private Integer access;

    private String uploadPicture;

    private String shenfen;

    private String shenfenAboutInfo;

    private String xueli;

    private Integer eduAge;
    public Teacher () {
        
    }

    public Teacher(Integer id, Integer status) {
        super.setId(id);
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    public String getIdCardAttache() {
        return idCardAttache;
    }

    public void setIdCardAttache(String idCardAttache) {
        this.idCardAttache = idCardAttache;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getFailReason() {
        return failReason;
    }

    public void setFailReason(String failReason) {
        this.failReason = failReason;
    }

    public Integer getAccess() {
        return access;
    }

    public void setAccess(Integer access) {
        this.access = access;
    }

    public String getUploadPicture() {
        return uploadPicture;
    }

    public void setUploadPicture(String uploadPicture) {
        this.uploadPicture = uploadPicture;
    }

    public String getShenfen() {
        return shenfen;
    }

    public void setShenfen(String shenfen) {
        this.shenfen = shenfen;
    }

    public String getShenfenAboutInfo() {
        return shenfenAboutInfo;
    }

    public void setShenfenAboutInfo(String shenfenAboutInfo) {
        this.shenfenAboutInfo = shenfenAboutInfo;
    }

    public String getXueli() {
        return xueli;
    }

    public void setXueli(String xueli) {
        this.xueli = xueli;
    }

    public Integer getEduAge() {
        return eduAge;
    }

    public void setEduAge(Integer eduAge) {
        this.eduAge = eduAge;
    }

}