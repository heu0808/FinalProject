package com.kh.finalProject.chat.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.chat.model.vo.ChattingRoom;
import com.kh.finalProject.chat.model.vo.Message;

@Repository
public class ChatDao {

	public int insertChat(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("chatMapper.insertChat", m);
	}
	
	public int deleteChat(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.update("chatMapper.deleteChat", m);
	}
	
	public ArrayList<Message> messageList(SqlSessionTemplate sqlSession, Message m) {
		return (ArrayList)sqlSession.selectList("chatMapper.messageList", m);	
	}
	
	public ArrayList<Message> searchMessage(SqlSessionTemplate sqlSession, String searchText) {
		Map<String, String> parameters = new HashMap<>();
        parameters.put("searchText", searchText);
        return (ArrayList)sqlSession.selectList("chatMapper.searchMessage", parameters);
	}
	
	public ArrayList<ChattingRoom> chattingRoomList (SqlSessionTemplate sqlSession, ChattingRoom cr){
		return (ArrayList)sqlSession.selectList("chatMapper.chattingRoomList", cr);
	}
}
