package com.cheny.message;

import java.util.List;
import java.util.Map;

import com.cheny.web.bean.Message;

public interface MessageMapper {

    public void addMessage(Message message) throws Exception;

    public void updateMessage(Map<String, Object> param) throws Exception;

    public void deleteMessage(Integer id) throws Exception;

    public Message getMessageById(Integer id) throws Exception;

    public List<Message> getMessageByPage(Map<String, Object> param) throws Exception;

    public Message getMaxIdMessage() throws Exception;

    public Message getMessageByUsername(String username) throws Exception;

    public void updatePassword(Message message) throws Exception;

    public Integer getUnreadMessageNum(Map<String, Object> param) throws Exception;
}
