package com.cheny.web.bean;

import java.util.List;

public class Household extends Common {

    /**
     * household.username (用户名)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String username;

    /**
     * household.password (密码)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String password;

    /**
     * household.name (姓名)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String name;

    /**
     * household.sex (性别)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String sex;

    /**
     * household.phone (电话号码)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String phone;

    /**
     * household.upload_picture (上传头像)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String uploadPicture;

    /**
     * household.birthday (出生日期)
     * @ibatorgenerated 2015-04-21 11:45:54
     */
    private String birthday;

    private List<Child> householdChildList;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUploadPicture() {
        return uploadPicture;
    }

    public void setUploadPicture(String uploadPicture) {
        this.uploadPicture = uploadPicture;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public List<Child> getHouseholdChildList() {
        return householdChildList;
    }

    public void setHouseholdChildList(List<Child> householdChildList) {
        this.householdChildList = householdChildList;
    }
}