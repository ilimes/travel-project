package com.project.trip.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/echo.do")
public class ChatController {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
    public ChatController() {
        System.out.println("웹소켓(서버) 객체생성");
    }
    
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("대화방에 연결 되었습니다.");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : ChatController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                	session.getBasicRemote().sendText(sender+" : <br><div class='balloon2'>"+message+"</div>");
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	if(message.split(",")[1].equals("★ 입장알림")) {
    		String sender = message.split(",")[1];
    		String printNickName = message.split(",")[0];
    		message = "<span style='color: #003f7e;'><strong>" + message.split(",")[0] + " 님께서 입장하셨습니다.</strong></span>";
    		
    		logger.info("Message From "+sender + ": "+message);
    		try {
    			final Basic basic=session.getBasicRemote();
    			System.out.println("현재 오픈채팅방에 " + printNickName + "님이 입장하셨습니다 :)");
    		}catch (Exception e) {
    			System.out.println(e.getMessage());
    		}
    		sendAllSessionToMessage(session, sender, message);
    	}
    	else if(message.split(",")[1].equals("★ 퇴장알림")) {
    		String sender = message.split(",")[1];
    		String printNickName = message.split(",")[0];
    		message = "<span style='color: #dc3545;'><strong>" + message.split(",")[0] + " 님께서 퇴장하셨습니다.</strong></span>";
    		
    		logger.info("Message From "+sender + ": "+message);
    		try {
    			final Basic basic=session.getBasicRemote();
    			System.out.println("오픈채팅방에서 " + printNickName + "님이 퇴장하셨습니다 :)");
    		}catch (Exception e) {
    			System.out.println(e.getMessage());
    		}
    		sendAllSessionToMessage(session, sender, message);
    	}
    	else {
    		String sender = message.split(",")[1];
    		message = message.split(",")[0];
    		
    		logger.info("Message From "+sender + ": "+message);
    		try {
    			final Basic basic=session.getBasicRemote();
    			basic.sendText("<div style='text-align: right;'><b>(나)</b> <br><div class='balloon1'>"+message+"</div></div>");
    		}catch (Exception e) {
    			System.out.println(e.getMessage());
    		}
    		sendAllSessionToMessage(session, sender, message);
    	}
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        
        sessionList.remove(session);
    }
}

