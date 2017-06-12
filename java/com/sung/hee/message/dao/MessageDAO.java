package com.sung.hee.message.dao;

import java.util.List;

import com.sung.hee.message.model.SHMessage;

public interface MessageDAO {
	void sendMessage(SHMessage message);
	List<SHMessage> messageListAll();
	List<SHMessage> messageList(SHMessage message);
	void readMessage(SHMessage message);
	void deleteMessage(SHMessage message);

}
