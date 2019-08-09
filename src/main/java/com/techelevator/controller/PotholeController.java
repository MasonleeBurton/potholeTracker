package com.techelevator.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Pothole;
import com.techelevator.model.StateList;
import com.techelevator.model.Status;
import com.techelevator.model.User;
import com.techelevator.model.dao.PotholeDAO;

@Controller
public class PotholeController {

	@Autowired
	PotholeDAO potholeDao;

	@GetMapping("/")
	public String homePage(ModelMap map) {
		map.addAttribute("potholes", potholeDao.getAll());
		map.addAttribute("status", new Status());

		return "index";
	}

	@PostMapping("/update")
	public String updateStatus(@ModelAttribute("status") Status status, @RequestParam long potholeId,
			BindingResult result, HttpSession session) {
		if (session.getAttribute("currentUser") != null
				&& ((User) session.getAttribute("currentUser")).getRole().equals("employee")) {
			if (result.hasErrors()) {
				return "/";
			}

			potholeDao.updateStatus(status, potholeId);
			return "redirect:/";
		} else {
			return "redirect:/login";
		}

	}

	@PostMapping("/delete")
	public String DeletePothole(HttpServletRequest req, HttpSession session) {
		String potholeId = req.getParameter("potholeId");
		long longPotholeId = Long.parseLong(potholeId);
		if (session.getAttribute("currentUser") != null
				&& ((User) session.getAttribute("currentUser")).getRole().equals("employee")) {
			potholeDao.delete(longPotholeId);

			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/submit")
	public String showSurveyResult(ModelMap map, HttpSession session) {
		if (session.getAttribute("currentUser") != null) {

			if (!map.containsAttribute("pothole")) {
				map.put("pothole", new Pothole());
				map.put("states", StateList.getStateCodes());
			}
			return "submit";
		} else {
			return "redirect:/login";
		}
	}

	@PostMapping("/submit")
	public String processSurveyInput(@Valid @ModelAttribute("pothole") Pothole pothole, BindingResult result,
			HttpSession session) {
		if (session.getAttribute("currentUser") != null) {

			if (result.hasErrors()) {
				return "submit";
			}
			potholeDao.create(pothole);

			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}
}