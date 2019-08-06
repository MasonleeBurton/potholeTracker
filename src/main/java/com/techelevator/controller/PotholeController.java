package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.techelevator.model.Pothole;
import com.techelevator.model.User;
import com.techelevator.model.dao.PotholeDAO;

@Controller
public class PotholeController {

	@Autowired
	PotholeDAO potholeDao;

	@GetMapping("/")
	public String homePage(ModelMap map) {
		map.addAttribute("potholes", potholeDao.getAll());

		return "index";
	}

	@GetMapping("/submit")
	public String showSurveyResult(ModelMap map) {
		if (!map.containsAttribute("user")) {
			map.put("user", new User());
		}

		return "submitPothole";
	}

//	@PostMapping("/submit")
//	public String processSurveyInput(@Valid @ModelAttribute("pothole") Pothole pothole, BindingResult result) {
//		
//		if (result.hasErrors()) {
//            return "redirect:/submit";
//		}
//		potholeDao.create(pothole);
//
//		return "redirect:/";
//	}

}