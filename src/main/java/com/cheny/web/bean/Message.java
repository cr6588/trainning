package com.cheny.web.bean;


public class Message {
    /**
     * message.id (主键)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private Integer id;

    /**
     * message.add_time (添加时间)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private String addTime;

    /**
     * message.add_user (添加人名称)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private String addUser;

    /**
     * message.title (消息消息标题)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private String title;

    /**
     * message.content (消息内容)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private String content;

    /**
     * message.send_user_id (发送者主键)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private Integer sendUserId;

    /**
     * message.send_user_type (发送者用户类型)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private Integer sendUserType;

    /**
     * message.get_user_id (接收者主键)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private Integer getUserId;

    /**
     * message.get_user_type (get_user_type)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private Integer getUserType;

    /**
     * message.status (是否已读（0：未读；1：已读）)
     * @ibatorgenerated 2015-04-28 15:00:54
     */
    private Integer status;

    private String sendUserUsername;

    private String getUserUsername;
    /**
     * 发送类型
     */
    private Integer sendType;

    public Message() {
    }

    public Message(String title, String content, Integer sendUserId, Integer sendUserType, Integer getUserId, Integer getUserType, String sendUserUsername) {
        this.title = title;
        this.content = content;
        this.sendUserId = sendUserId;
        this.sendUserType = sendUserType;
        this.getUserId = getUserId;
        this.getUserType = getUserType;
        this.sendUserUsername = sendUserUsername;
    }





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

    public String getAddUser() {
        return addUser;
    }

    public void setAddUser(String addUser) {
        this.addUser = addUser;
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

    public Integer getSendUserId() {
        return sendUserId;
    }

    public void setSendUserId(Integer sendUserId) {
        this.sendUserId = sendUserId;
    }

    public Integer getSendUserType() {
        return sendUserType;
    }

    public void setSendUserType(Integer sendUserType) {
        this.sendUserType = sendUserType;
    }

    public Integer getGetUserId() {
        return getUserId;
    }

    public void setGetUserId(Integer getUserId) {
        this.getUserId = getUserId;
    }

    public Integer getGetUserType() {
        return getUserType;
    }

    public void setGetUserType(Integer getUserType) {
        this.getUserType = getUserType;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getSendUserUsername() {
        return sendUserUsername;
    }

    public void setSendUserUsername(String sendUserUsername) {
        this.sendUserUsername = sendUserUsername;
    }

    public String getGetUserUsername() {
        return getUserUsername;
    }

    public void setGetUserUsername(String getUserUsername) {
        this.getUserUsername = getUserUsername;
    }

    public Integer getSendType() {
        return sendType;
    }

    public void setSendType(Integer sendType) {
        this.sendType = sendType;
    }

    
}