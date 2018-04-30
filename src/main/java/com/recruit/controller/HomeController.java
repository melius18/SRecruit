package com.recruit.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.recruit.domain.BoardVO;
import com.recruit.domain.MessageVO;
import com.recruit.domain.PreferenceVO;
import com.recruit.service.CRecruitService;
import com.recruit.service.PUserService;
import com.recruit.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private UserService service;
	
	@Inject
	private PUserService PService;
	@Inject
	private CRecruitService CService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "home";
	}

	//장우
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexGET(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "search/S_index";
	}

	@RequestMapping(value = "/2", method = RequestMethod.GET)
	public String indexTest(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "home2";
	}
	@RequestMapping(value = "/socket.io/", method = RequestMethod.GET)
	public void in1dexTest(Locale locale, Model model) throws Exception {
		
	}

	// 알림창 카운트 소연
	@ResponseBody
	@RequestMapping(value = "/message_count", method = RequestMethod.POST)
	public ResponseEntity<String> message_count(HttpSession session) throws Exception {
	//public ResponseEntity<String> recomModify(@RequestBody String id) throws Exception {
		System.out.println("message count POST Controller");
		
		ResponseEntity<String> entity = null;
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			
			try{			
				String countURmessage = ""+service.countURmessage(id);
				//UserService UserDAO//userMapper//알림 카운트하는 서비스//소연
				entity = new ResponseEntity<String>(countURmessage, HttpStatus.OK);
				System.out.println(countURmessage);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else {
			entity = new ResponseEntity<String>("", HttpStatus.OK);
		}
		return entity;
	}
	
	// 알림창 소연
	@ResponseBody
	@RequestMapping(value = "/message_read", method = RequestMethod.POST)
	public List<MessageVO> message_read(HttpSession session) throws Exception {
		System.out.println("message read POST Controller");
		
		List<MessageVO> entity = null;
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			
			try{			
				System.out.println("메시지 5개 미리 보기");
				
				entity = service.readFivemessage(id);
				
				/*for(int i=0; i<entity.size(); i++){
					String title = CService.selectCROne(Integer.parseInt(entity.get(i).getRcno())).getTitle();
					entity.get(i).setRcno(title);
				}*/
				
			}catch(Exception e){
				e.printStackTrace();
			}
		} else {
			entity = new ArrayList<MessageVO>(1);
			entity.add(null);
		}
		return entity;
	}
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String messageGET(HttpSession session, Model model, RedirectAttributes rttr) throws Exception {

		logger.info("message GET CONTROLLER");

		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			model.addAttribute(PService.selectPUser(id));
			
			List<MessageVO> entity = new ArrayList<>();
			entity = service.readAllmessage(id);//전체 메시지 불러오기
			
			for(int i=0;i<entity.size();i++){
				String title = CService.selectCROne(Integer.parseInt(entity.get(i).getRcno())).getTitle();
				entity.get(i).setAppliedpid(title);
			}
			
			model.addAttribute("MessageVOlist",entity);

			return "message";
		} else {
			rttr.addFlashAttribute("msg", "login");
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/message_infinite", method = RequestMethod.POST)
	public List<MessageVO> message_infinite(HttpSession session, RedirectAttributes rttr,@RequestBody MessageVO msvo ){

		logger.info("message_infinite CONTROLLER");
		//List<MessageVO> entity = null;
		List<MessageVO> entity = new ArrayList<>();
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			
			try{
				System.out.println("끝"+msvo.getBno());
				String gostop = service.Maxmassagebno(msvo);
				System.out.println(gostop);
				
				if(gostop.equals("keep")){
					msvo.setUserid(id);
					System.out.println("ㅏㅏㅏㅏ"+msvo);
					entity = service.Readmessage_paging(msvo);//페이징 처리한 전체 메시지 불러오기
					System.out.println("ㅗㅗㅗㅗ"+entity);
					System.out.println("롸"+entity.size());
					
					for(int i=0;i<entity.size();i++){
						String title = CService.selectCROne(Integer.parseInt(entity.get(i).getRcno())).getTitle();
						entity.get(i).setAppliedpid(title);
						System.out.println("ㅗㅗㅗdㅗ"+entity.get(i));
					}
				}else{
					return entity = null;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		} else {
			entity = new ArrayList<MessageVO>(1);
			entity.add(null);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/message_readornot", method = RequestMethod.POST)
	public ResponseEntity<String> message_readornot(HttpSession session, @RequestBody MessageVO msvo) throws Exception {
		System.out.println("message_readornot POST Controller");
		
		ResponseEntity<String> entity = null;
		
		BoardVO login = (BoardVO) session.getAttribute("login");
		if (login != null) {
			String id = login.getId();
			
			try{			
				System.out.println("msvo"+msvo);
				service.Readedmessage(msvo);//읽음 서비스 실행
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
			}
		} else {
			entity = new ResponseEntity<String>("FALSE", HttpStatus.OK);
		}
		return entity;
	}
	//
}
