package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.techelevator.model.dao.PotholeDAO;

@Controller
public class PotholeController {
	
	@Autowired
	PotholeDAO potholeDAO;
	
	@GetMapping("/")
	public String homePage(ModelMap map) {
		map.addAttribute("potholes", potholeDAO.getAll());
		
		return "index";
	}	
}