package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.dao.UserDAO;

@Controller
public class UserController {

	
	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute User user, String employeeCode, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("user", user);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			return "redirect:/";
		}
		
			user.setRole("user");
		
		if (userDAO.getUserByUserName(user.getUserName()) != null) {
			flash.addFlashAttribute("emailUsed", "That email is already in use");
			return "redirect:/users/new";
		}
			
		userDAO.saveUser(user.getUserName(), user.getPassword(), user.getRole());
		return "redirect:/login";
	}
	
	@RequestMapping(path="/updateRole", method=RequestMethod.POST)
	public String updateRole(HttpServletRequest req, HttpSession session, RedirectAttributes redirectAttributes) {
		
		if (session.getAttribute("currentUser") != null
				&& ((User) session.getAttribute("currentUser")).getRole().equals("employee")) {
			
			
		String userName = req.getParameter("userName");
		String role = req.getParameter("role");
		
		Object user = userDAO.getUserByUserName(userName.toUpperCase());
		
		System.out.println(user);
		
		if (user != null) {
			userDAO.updateRole(userName, role);
			redirectAttributes.addFlashAttribute("message", userName + " is now a " + role + ".");
		}
		else {
			redirectAttributes.addFlashAttribute("message", "User doesn't exist.");
		}
		
		return "redirect:/admin";
		}
		else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping("/admin")
	public String admin(HttpSession session) {
		
		if (session.getAttribute("currentUser") != null
				&& ((User) session.getAttribute("currentUser")).getRole().equals("employee")) {
		return "admin";
	}
	
	else {
		return "redirect:/login";
	}
	
}
}
