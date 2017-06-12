package com.sung.hee.message.dao;

import com.sung.hee.message.model.SHMessage;

import java.util.List;

public interface MessageService {
	void sendMessage(SHMessage message);
	List<SHMessage> messageListAll();
	List<SHMessage> messageList(SHMessage message);
	void readMessage(SHMessage message);
	void deleteMessage(SHMessage message);

}
