package com.project.trip.buy.controller;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trip.admin.service.AdminService;
import com.project.trip.buy.service.BuyService;
import com.project.trip.buy.vo.BuyVO;
import com.project.trip.cart.vo.CartVO;
import com.project.trip.item.service.ItemService;
import com.project.trip.item.vo.ItemVO;
import com.project.trip.member.service.MemberService;
import com.project.trip.member.vo.MemberVO;
import com.project.trip.member.vo.TempMemberVO;

import net.sf.json.JSONArray;
	
@CrossOrigin(value="*", methods ={RequestMethod.GET, RequestMethod.POST})
@Controller
@RequestMapping("/buy")
public class BuyController {
	
	@Resource(name = "buyService")
	private BuyService buyService;
	
	@Resource(name = "itemService")
	private ItemService itemService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource(name = "adminService")
	private AdminService adminService;

	//상품 단일구매
	@PostMapping("/buyItem")
	@ResponseBody
	public BuyVO buyItem(BuyVO buyVO, HttpSession session,TempMemberVO tempMemberVO) {
		
		if(session.getAttribute("loginInfo") != null) {
			String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
			buyVO.setMemId(memId);
			buyVO.setTemp("0");
			System.out.println(buyVO.getMemId());
			System.out.println(buyVO.getTemp());
		}
		else {
			buyVO.setMemId(tempMemberVO.getTempEmail());
			buyVO.setTemp("1");
			System.out.println(buyVO.getMemId());
		}
		
		
		SecureRandom random = new SecureRandom();
		int num = random.nextInt();
		if(num < 0 ) {
			num = num * -1;
		}
		String bookNum = num + "";
		
		
		buyVO.setBookNum(bookNum);
		tempMemberVO.setBookNum(bookNum);
		buyService.bookItem(buyVO, tempMemberVO);
		
		return buyVO;
		
	}
	
	@PostMapping("/buyItems")
	@ResponseBody
	public List<BuyVO> buyItems(Model model, String data, HttpSession session, BuyVO buyVO, TempMemberVO tempMemberVO) {
		System.out.println(data);
		String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		
		SecureRandom random = new SecureRandom();
		
		@SuppressWarnings("unchecked")
		List<Map<String, String>> list = JSONArray.fromObject(data);
		//itemCode가 담길 배열
		String[] itemCodeArr = new String[list.size()];
		int index = 0;
		
		List<BuyVO> buyList = new ArrayList<BuyVO>();
		for(Map<String, String> map : list) {
			System.out.println("itemCode : " + map.get("itemCode") + " / travelers=" + map.get("travelers"));
			
			int num = random.nextInt();
			if(num < 0 ) {
				num = num * -1;
			}
			String bookNum = num + "";
			
			
			BuyVO vo = new BuyVO();
			vo.setBookNum(bookNum);
			vo.setMemId(memId);
			vo.setItemCode(map.get("itemCode"));
			vo.setTravelers(Integer.parseInt(map.get("travelers")));
			
			buyList.add(vo);
			itemCodeArr[index++] = map.get("itemCode");
		}
		buyVO.setBuyList(buyList);
		CartVO cartVO = new CartVO(); //memId, itemCode
		cartVO.setMemId(memId);
		buyVO.setMemId(memId);
		cartVO.setItemCodeArr(itemCodeArr);
		buyService.selectedBuyCartList(buyVO, cartVO);
		
		return buyList;
	}
	
	
	//상품 선택구매
	@PostMapping("/tripBook")
	public String tripBook(Model model, String data, HttpSession session, BuyVO buyVO) {
		
		String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		ItemVO itemVO = new ItemVO();
		@SuppressWarnings("unchecked")
		List<Map<String, String>> list = JSONArray.fromObject(data);
		//itemCode가 담길 배열

		List<Integer> bookItemCnt = new ArrayList<Integer>();
		List<Integer> travelers = new ArrayList<Integer>();
		List<ItemVO> itemInfo = new ArrayList<ItemVO>();
		int buyPrice = 0;
		int index = 0;
		
		for(Map<String, String> map : list) {
			System.out.println("itemCode : " + map.get("itemCode") + " / travelers=" + map.get("travelers"));
			itemVO.setItemCode(map.get("itemCode"));
			bookItemCnt.add(itemService.selectBookItemCnt(itemVO));
			travelers.add(Integer.parseInt(map.get("travelers")));
			itemInfo.add(itemService.selectItemDetail(itemVO));
			buyPrice = buyPrice + itemInfo.get(index).getItemPrice();
			index++;
		}
		model.addAttribute("menuList", adminService.selectMenuList());
		model.addAttribute("buyPrice", buyPrice);
		model.addAttribute("bookItemCnt", bookItemCnt);
		model.addAttribute("travelers", travelers);
		model.addAttribute("itemInfo", itemInfo);
		model.addAttribute("memberInfo", memberService.selectMemberInfo(memberVO));
		
		
		return "buy/buy_form_from_cart";
	}
	

	@RequestMapping("/buyForm")
	public String buyForm(Model model, HttpSession session, BuyVO buyVO, ItemVO itemVO, MemberVO memberVO) {
		if(session.getAttribute("loginInfo") != null) {
			String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
			memberVO.setMemId(memId);
		}
		
		model.addAttribute("bookItemCnt", itemService.selectBookItemCnt(itemVO));
		model.addAttribute("memberInfo", memberService.selectMemberInfo(memberVO));
		model.addAttribute("itemInfo", itemService.selectItemDetail(itemVO));
		
		return "buy/buy_form";
	}
	
	@GetMapping("/buySuccess")
	public String buySuccess(BuyVO buyVO) {
		return "buy/buy_success";
	}
	@GetMapping("/buySuccessFromCart")
	public String buySuccessFromCart(BuyVO buyVO, int size, Model model) {
		
		model.addAttribute("itemCode", buyVO.getItemCode());
		model.addAttribute("size", size - 1);
		return "buy/buy_success_from_cart";
	}
	
	@GetMapping("/buyFail")
	public String buyFail(Model model, String errorMsg) {
		model.addAttribute("errorMsg", errorMsg);
		return "buy/buy_fail";
	}
	
	@ResponseBody
	@PostMapping("/findBookInfo")
	public int findBookInfo(TempMemberVO tempMemberVO) {
		return buyService.findBookInfo(tempMemberVO);
	}
	
	@GetMapping("/deleteTempBook")
	public String deleteTempBook(TempMemberVO tempMemberVO) {
		buyService.deleteTempBook(tempMemberVO);
		return "redirect:/item/mainPage";
	}

}
