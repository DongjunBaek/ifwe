package com.kh.ifwe.fullcalendar.controller;



import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.ifwe.fullcalendar.model.service.FullcalendarService;
import com.kh.ifwe.fullcalendar.model.vo.Fullcalendar;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/fullcalendar")
public class FullcalendarController {

	@Autowired
	FullcalendarService fullcalendarservice;

	@Autowired
	ServletContext servletContext;

	@Autowired
	ResourceLoader resourceLoader;

	@GetMapping("/add.do")
	@ResponseBody
	public void addFullcalendar(Model model, @ModelAttribute Fullcalendar fullcalendar, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		log.debug(fullcalendar.toString());
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		fullcalendarservice.addFullcalendar(fullcalendar);
	}

	
	@GetMapping("/getfc")
	@ResponseBody
	public List<Fullcalendar> SelectFCList(Model model, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		
				List<Fullcalendar> FC = fullcalendarservice.selectList();
//		ModelAndView mav= new ModelAndView("jsonView");
//		mav.addObject("array",FC);
//		model.addAttribute("array",FC);
//		mav.setViewName("/");
//	  Fullcalendar FCT=	FC.get(0);
//		return mav;
				return FC;
		
	}
	
	@PostMapping("/updatefc")
	@ResponseBody
	public void UpdateFc(Model model,HttpServletRequest request,RedirectAttributes redirectAttributes, Fullcalendar fc)
	{
//		System.out.println("컨트롤러까지오나?");		
//		log.debug(fc.toString());
		int result = fullcalendarservice.updateFC(fc);	
		
	}
	
	@PostMapping("/deletefc")
	@ResponseBody
	public void DeleteFc(Model model,HttpServletRequest request,RedirectAttributes redirectAttributes, Fullcalendar fc)
	{
		System.out.println("컨트롤러까지오나?");		
		log.debug(fc.toString());
		
		int result = fullcalendarservice.deleteFC(fc);	
		
	}
	

}
