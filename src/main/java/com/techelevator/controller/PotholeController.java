package com.techelevator.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Address;
import com.techelevator.model.Pothole;
import com.techelevator.model.StateList;
import com.techelevator.model.Status;
import com.techelevator.model.User;
import com.techelevator.model.dao.PotholeDAO;

@Controller
public class PotholeController {

	@Autowired
	PotholeDAO potholeDao;

	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/")
	public String mapPage(ModelMap map) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		map.addAttribute("potholes", mapper.writeValueAsString(potholeDao.getAll()));
		map.addAttribute("status", new Status());
		map.addAttribute("states", mapper.writeValueAsString(StateList.getStateCodes()));

		return "potholeMap";
	}
	
	@PostMapping("/submitMap")
	public String processSurveyMapForm(@RequestParam("file") MultipartFile file, ModelMap map, HttpSession session, @RequestParam String size,
			@RequestParam String description, @RequestParam String addressLine1, @RequestParam String addressLine2, @RequestParam String city,
			@RequestParam String state, @RequestParam int zip, @RequestParam String latitude, @RequestParam String longitude
			) {		
		if (session.getAttribute("currentUser") != null) {
			
			Address address = new Address();
			address.setAddressLine1(addressLine1);
			address.setAddressLine2(addressLine2);
			address.setCity(city);
			address.setState(state);
			address.setZipCode(zip);
			
			Pothole pothole = new Pothole();
			pothole.setSize(size);
			pothole.setDescription(description);
			pothole.setAddress(address);
			pothole.setLatitude(latitude);
			pothole.setLongitude(longitude);
			
			if (file.isEmpty()) {
				pothole.setHasImage(false);
			}
			else {
				pothole.setHasImage(true);
			}
			
			potholeDao.create(pothole);

			File imagePath = getImageFilePath();
			String imageName = imagePath + File.separator + pothole.getId();

			if (file.isEmpty()) {
				map.addAttribute("message", "File Object empty");
			} else {
				createImage(file, imageName);
			}
			map.addAttribute("message", "uploaded to: " + imageName);

			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/list")
	public String listPage(ModelMap map) {
		map.addAttribute("potholes", potholeDao.getAll());
		map.addAttribute("status", new Status());

		String imagePath = getServerContextPath() + File.separator;

		map.addAttribute("imagePath", imagePath);

		return "index";
	}

	@RequestMapping(path = "/image/{imageName}", method = RequestMethod.GET)
	@ResponseBody
	public byte[] getImage(@PathVariable(value = "imageName") String imageName) {
		String imagePath = getServerContextPath() + File.separator + imageName;
		File image = new File(imagePath);
		try {
			return Files.readAllBytes(image.toPath());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

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
			return "redirect:/list";
		} else {
			return "redirect:/login";
		}

	}

	@PostMapping("/delete")
	public String DeletePothole(HttpServletRequest req, HttpSession session) throws IOException {
		String potholeId = req.getParameter("potholeId");
		long longPotholeId = Long.parseLong(potholeId);
		if (session.getAttribute("currentUser") != null
				&& ((User) session.getAttribute("currentUser")).getRole().equals("employee")) {
			potholeDao.delete(longPotholeId);

			String imagePath = getServerContextPath() + File.separator + longPotholeId;
			FileUtils.touch(new File(imagePath));

			FileUtils.forceDelete(FileUtils.getFile(imagePath));

			return "redirect:/list";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/submit")
	public String submitPothole(ModelMap map, HttpSession session) {
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
	public String processSurveyInput(@RequestParam("file") MultipartFile file, ModelMap map,
			@Valid @ModelAttribute("pothole") Pothole pothole, BindingResult result, HttpSession session) {
		if (session.getAttribute("currentUser") != null) {

			if (result.hasErrors()) {
				return "submit";
			}
			if (file.isEmpty()) {
				pothole.setHasImage(false);
			}
			else {
				pothole.setHasImage(true);
			}
			potholeDao.create(pothole);

			File imagePath = getImageFilePath();
			String imageName = imagePath + File.separator + pothole.getId();

			if (file.isEmpty()) {
				map.addAttribute("message", "File Object empty");
				
			} else {
				createImage(file, imageName);
			}
			map.addAttribute("message", "uploaded to: " + imageName);

			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}
	
	private File getImageFilePath() {
		String serverPath = getServerContextPath();
		File filePath = new File(serverPath);
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		return filePath;
	}

	private String getServerContextPath() {
		return servletContext.getRealPath("/") + "uploads";
	}

	private void createImage(MultipartFile file, String name) {
		File image = new File(name);
		try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(image))) {

			stream.write(file.getBytes());

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}