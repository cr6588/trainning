package com.cheny.web.bean;

public class Child extends Common {

    /**
     * child.name (姓名)
     * @ibatorgenerated 2015-04-21 11:53:20
     */
    private String name;

    /**
     * child.sex (性别)
     * @ibatorgenerated 2015-04-21 11:53:20
     */
    private String sex;

    /**
     * child.phone (电话号码)
     * @ibatorgenerated 2015-04-21 11:53:20
     */
    private String phone;

    /**
     * child.birthday (出生日期)
     * @ibatorgenerated 2015-04-21 11:53:20
     */
    private String birthday;

    /**
     * child.household_id (家长主键)
     * @ibatorgenerated 2015-04-21 11:53:20
     */
    private Integer householdId;

    private Household household;
    
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

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getHouseholdId() {
        return householdId;
    }

    public void setHouseholdId(Integer householdId) {
        this.householdId = householdId;
    }

    public Household getHousehold() {
        return household;
    }

    public void setHousehold(Household household) {
        this.household = household;
    }

}