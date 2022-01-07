package com.cognizant.controller;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.cognizant.model.User;
import com.cognizant.service.UserService;

@Controller
public class PrimaryController {

	@Autowired
	UserService service;
	
	@GetMapping("/")
	public String goHome(@ModelAttribute("user") User user,HttpSession session, Model model) {
		return "home";
	}
	
	@PostMapping("/register")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result,HttpSession session, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("regmsg", "Please update all the mandatory field(s)");
			model.addAttribute("feature", "reg");
		}else {
			model.addAttribute("feature", "reg");
			if(Period.between(user.getDob().toLocalDate(), LocalDate.now()).getYears()<18) {
				System.out.println(Period.between(user.getDob().toLocalDate(), LocalDate.now()).getYears());
				model.addAttribute("regmsg", "User must be 18y or older");
				return "home";
			}
			if(service.findByEmail(user.getEmail())!=null) {
				model.addAttribute("email", "no");
				return "home";
			}
			if(service.findByUserId(user.getUserId())!=null) {
				model.addAttribute("available", "no");
				return "home";
			}
			service.saveUser(user);
			model.addAttribute("available", "yes");
			model.addAttribute("regmsg", "New user registration successful");
		}
		return "home";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("user") User user,HttpSession session, Model model) {
		User user2 = service.findByUserId(user.getUserId());
		if(user2==null) {
			model.addAttribute("msg", "Invalid UserId (or) Password");
		}else {
			if(user2.getPassword().equals(user.getPassword())) {
				session.setAttribute("user", user2);
				model.addAttribute("user", user2);
				return "welcome";
			}else {
				model.addAttribute("msg", "Invalid UserId (or) Password");
			}
		}
		model.addAttribute("feature", "login");
		return "home";
	}
	
	@GetMapping("/forgotuserid")
	public String goToFUserId(@ModelAttribute("user") User user,HttpSession session, Model model) {
		return "forgotuserid";
	}
	
	@GetMapping("/forgotpswd")
	public String goToFPswd(@ModelAttribute("user") User user,HttpSession session, Model model) {
		return "forgotpswd";
	}
	
	@PostMapping("/getid")
	public String getUserId(@ModelAttribute("user") User user,HttpSession session, Model model) {
		
		User user2 = service.findByEmail(user.getEmail());
		if (user2 == null) {
			model.addAttribute("getidmsg", "Sorry! Please check ur email.");
			return "forgotuserID";
		}
		if (!(user2.getQuestion().equals(user.getQuestion()))) {
			model.addAttribute("getidmsg", "It seems like you have chosen a wrong question.");
			return "forgotuserID";
		}
		if (!(user2.getAnswer().equalsIgnoreCase(user.getAnswer()))) {
			model.addAttribute("getidmsg", "OOPS! Your answer is wrong");
			return "forgotuserID";
		}
		model.addAttribute("getidmsg", "Oola! Your Id is \"" + user2.getUserId() + "\"...Continue Login");
		return "forgotuserid";
	}
	
	@PostMapping("/resetpassword")
	public String checkUpassword(@ModelAttribute("user") User user, Model model, HttpSession session) {
		User user2 = service.findByUserId(user.getUserId());
		if (user2 == null) {
			model.addAttribute("getpassmsg", "Sorry! It seems like you have given a wrong UserId.");
			return "forgotpassword";
		}
		if (!(user2.getQuestion().equals(user.getQuestion()))) {
			model.addAttribute("getpassmsg", "It seems like you have chosen a wrong question.");
			return "forgotpassword";
		}
		if (!(user2.getAnswer().equalsIgnoreCase(user.getAnswer()))) {
			model.addAttribute("getpassmsg", "OOPS! Your answer is wrong");
			return "forgotpassword";
		}
		session.setAttribute("userId", user2.getUserId());
		return "resetpassword";
	}

	@PostMapping("/passwordreseted")
	public String updatePassword(@ModelAttribute("user") User user, Model model, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		user.setUserId(userId);
		service.updatePassword(user);
		model.addAttribute("getmsg", "Password Reset Successful");
		return "resetpassword";
	}
	
	@PostMapping("/delete")
	public String deleteAccount(@RequestBody String password,@ModelAttribute("user") User user,HttpSession session, Model model) {
		User u = (User) session.getAttribute("user");
		password=password.substring(9);
		System.out.println(password +" " +u.getPassword());
		if(password.equals(u.getPassword())) {
			service.deleteUser(u.getId());
			model.addAttribute("regmsg", "Your account has been deleted");
			return "home";
		}
		model.addAttribute("msg", "Incorrect Password");
		return "welcome";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ModelAttribute("questions")
	public List<String> getQuestions() {
		List<String> li = new ArrayList<>();
		li.add("Favourite Color");
		li.add("Childhood pet name");
		li.add("School name");
		return li;
	}
}
