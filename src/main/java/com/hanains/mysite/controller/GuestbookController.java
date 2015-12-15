package com.hanains.mysite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanains.mysite.service.GuestbookService;
import com.hanains.mysite.vo.GuestbookVo;

@Controller
@RequestMapping( "/guestbook" )
public class GuestbookController {
	
	@Autowired
	private GuestbookService guestbookService;
	
	@RequestMapping( "" )
	public String list( Model model ) {
		List<GuestbookVo> list = guestbookService.listMessage( 1L );
		model.addAttribute( "list", list );
		return "/guestbook/list";
	}
}