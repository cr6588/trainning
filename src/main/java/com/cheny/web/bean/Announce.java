package com.cheny.web.bean;

public class Announce extends Common{

    private String updateUser;

    /**
     * announce.title (标题)
     * @ibatorgenerated 2015-05-07 13:58:13
     */
    private String title;

    /**
     * announce.content (内容)
     * @ibatorgenerated 2015-05-07 13:58:13
     */
    private String content;

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}