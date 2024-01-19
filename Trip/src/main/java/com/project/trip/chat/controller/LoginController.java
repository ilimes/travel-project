package com.project.trip.chat.controller;

import java.net.*;
import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trip.admin.vo.SubMenuVO;

@Controller
@RequestMapping("/chat")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "chat/login";
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(@RequestParam String id, HttpServletRequest request, Model model, String menuCode) throws UnknownHostException {
		
		logger.info("Welcome "+id);
		
    	HttpSession session = request.getSession();
    	session.setAttribute("id", id);

		String hostAddr = "";

		try {
			Enumeration<NetworkInterface> nienum = NetworkInterface.getNetworkInterfaces();
			while (nienum.hasMoreElements()) {
				NetworkInterface ni = nienum.nextElement();
				Enumeration<InetAddress> kk= ni.getInetAddresses();
				while (kk.hasMoreElements()) {
					InetAddress inetAddress = kk.nextElement();
					if (!inetAddress.isLoopbackAddress() &&
							!inetAddress.isLinkLocalAddress() &&
							inetAddress.isSiteLocalAddress()) {
						hostAddr = inetAddress.getHostAddress().toString();
					}
				}
			}
		} catch (SocketException e) {
			e.printStackTrace();
		}

    	//서버 아이피 주소 얻기(IPv4)
		//model.addAttribute("serverIpAddress", hostAddr);

		//각 서버 아이피 불러오는 대신 OCI IP로 설정
		model.addAttribute("serverIpAddress", "146.56.144.64");

		return "chat/chat";
	}
	
}
