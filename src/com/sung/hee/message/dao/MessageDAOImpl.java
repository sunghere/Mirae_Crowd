package com.sung.hee.message.dao;

import com.sung.hee.message.model.SHMessage;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	String ns = "SHMessage.";
	
	@Autowired
	SqlSession sqlSession;

	public void sendMessage(SHMessage message) {
		sqlSession.insert(ns+"sendMessage", message);
	}

	public List<SHMessage> messageListAll() {
		return sqlSession.selectList(ns+"messageListAll");
	}

	public List<SHMessage> messageList(SHMessage message) {
		return sqlSession.selectList(ns+"messageList", message);
	}

	public void readMessage(SHMessage message) {
		sqlSession.update(ns+"readMessage", message);
	}

	public void deleteMessage(SHMessage message) {
		sqlSession.update(ns+"deleteMessage", message);
	}

}
