package com.project.trip.cart.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trip.cart.service.CartService;
import com.project.trip.cart.vo.CartVO;
import com.project.trip.cart.vo.CartViewVO;
import com.project.trip.member.vo.MemberVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Resource(name="cartService")
	private CartService cartService;
	
	//장바구니 리스트로 이동
	@GetMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		//memId 받아오기 - 세션에서
		String memId = "";
		if(session.getAttribute("loginInfo") == null) {
			memId = "emptyID";
		}
		else {
			memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		}
		
		//장바구니 목록 조회
		List<CartViewVO> cartList = cartService.selectCartList(memId);
		
		//구매가격 합 구하기
		int totalPrice = 0;
		for(CartViewVO e : cartList) {
			totalPrice = totalPrice + e.getTotalPrice();
		}
		model.addAttribute("totalPrice", totalPrice);
		
		//장바구니 리스트 전송
		model.addAttribute("cartList", cartList);
		
		return "cart/cart_list";
	}
	
	//장바구니에 넣기
	@ResponseBody
	@PostMapping("/insertCart")
	public String insertCart(HttpSession session, CartVO cartVO) {
		//memId 받아오기 - 세션에서
		String loginId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		//memId 채워주기
		cartVO.setMemId(loginId);
		
		//장바구니에 넣는 코드 실행
		String result = Integer.toString(cartService.insertCart(cartVO));
		
		return result;
	}
	
	//단일상품 장바구니 삭제
	@PostMapping("/deleteCart")
	public String deleteCart(CartVO cartVO) {
		cartService.deleteCart(cartVO);
		return "redirect:/cart/cartList";
	}
	
	//선택상품 장바구니에서 삭제
	@ResponseBody
	@PostMapping("/deleteCarts")
	public String deleteCarts(CartVO cartVO, HttpSession session, String data) {
		//memId 받아오기 - 세션에서
		String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		cartVO.setMemId(memId);
		
		List<String> list = JSONArray.fromObject(data);
		String[] itemCodeArr = new String[list.size()];
		for(int i = 0 ; i < list.size() ; i++) {
			itemCodeArr[i] = list.get(i);
		}
		
		cartVO.setItemCodeArr(itemCodeArr);
		
		String result = Integer.toString(cartService.deleteCarts(cartVO));
		
		return result;
	}
	
	//상품 수량 변경
	@ResponseBody
	@PostMapping("/updateItemCnt")
	public int updateItemCnt(CartVO cartVO, HttpSession session) {
		//memId 받아오기 - 세션에서
		String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		cartVO.setMemId(memId);
		
		int result = cartService.updateItemCnt(cartVO);
		
		return result;
	}
	
}
