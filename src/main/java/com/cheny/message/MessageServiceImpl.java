package com.cheny.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cheny.message.MessageMapper;
import com.cheny.message.MessageService;
import com.cheny.web.bean.Message;
@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageMapper messageMapper;
    @Override
    public void addMessage(Message message) throws Exception {
        messageMapper.addMessage(message);
    }

    @Override
    public void updateMessage(Map<String, Object> param) throws Exception {
        messageMapper.updateMessage(param);
    }

    @Override
    public void deleteMessage(Integer id) throws Exception {
        messageMapper.deleteMessage(id);
    }

    @Override
    public Message getMessageById(Integer id) throws Exception {
        return messageMapper.getMessageById(id);
    }

    @Override
    public List<Message> getMessageByPage(Map<String, Object> param) throws Exception {
        return messageMapper.getMessageByPage(param);
    }

    @Override
    public Message getMaxIdMessage() throws Exception {
        return messageMapper.getMaxIdMessage();
    }

    @Override
    public Message getMessageByUsername(String username) throws Exception {
        return messageMapper.getMessageByUsername(username);
    }

    @Override
    public void updatePassword(Message message) throws Exception {
        messageMapper.updatePassword(message);
    }

    @Override
    public Integer getUnreadMessageNum(Map<String, Object> param) throws Exception {
        return messageMapper.getUnreadMessageNum(param);
    }

}
