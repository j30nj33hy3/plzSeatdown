package com.bg.plzSeatdown.message.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import com.bg.plzSeatdown.message.model.dao.MessageDAO;

public class MessageEchoHandler extends TextWebSocketHandler{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final Logger logger = LoggerFactory.getLogger(getClass());

  @Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {	
	}

  @Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {	  
	}
  
  @Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
 	}
}

