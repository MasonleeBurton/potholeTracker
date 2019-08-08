package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Pothole;
import com.techelevator.model.StateList;
import com.techelevator.model.Status;
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
	
	@PutMapping("/")
	public String updateStatus(@Valid @ModelAttribute("status") Status status, @RequestParam long potholeId) {
		potholeDao.updateStatus(status, potholeId);
		
		return "redirect:/";
	}
	
	@DeleteMapping("/")
	public String DeletePothole(@RequestParam long potholeId){
		potholeDao.delete(potholeId);
		
		return "redirect:/";
	}

	@GetMapping("/submit")
	public String showSurveyResult(ModelMap map) {
		if (!map.containsAttribute("pothole")) {
			map.put("pothole", new Pothole());
			map.put("states", StateList.getStateCodes());
		}
		return "submit";
	}

	@PostMapping("/submit")
	public String processSurveyInput(@Valid @ModelAttribute("pothole") Pothole pothole, BindingResult result) {
		
		if (result.hasErrors()) {
            return "submit";
		}
		potholeDao.create(pothole);

		return "redirect:/";
	}
}