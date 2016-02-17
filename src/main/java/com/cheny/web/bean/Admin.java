package com.cheny.web.bean;

public class Admin extends Common {
    /**
     * `admin`.username (用户名)
     * @ibatorgenerated 2015-04-22 09:45:12
     */
    private String username;

    /**
     * `admin`.password (密码)
     * @ibatorgenerated 2015-04-22 09:45:12
     */
    private String password;

    /**
     * `admin`.name (姓名)
     * @ibatorgenerated 2015-04-22 09:45:12
     */
    private String name;

    /**
     * `admin`.phone (电话号码)
     * @ibatorgenerated 2015-04-22 09:45:12
     */
    private String phone;

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}