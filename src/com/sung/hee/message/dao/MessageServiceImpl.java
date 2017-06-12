package com.sung.hee.message.dao;

import com.sung.hee.message.model.SHMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDAO messageDao;

    @Transactional
    public void sendMessage(SHMessage message) {
        messageDao.sendMessage(message);
    }

    @Transactional(readOnly = true)
    public List<SHMessage> messageListAll() {
        return messageDao.messageListAll();
    }

    @Transactional(readOnly = true)
    public List<SHMessage> messageList(SHMessage message) {
        return messageDao.messageList(message);
    }

    @Transactional
    public void readMessage(SHMessage message) {
        messageDao.readMessage(message);
    }

    @Transactional
    public void deleteMessage(SHMessage message) {
        messageDao.deleteMessage(message);
    }

}
