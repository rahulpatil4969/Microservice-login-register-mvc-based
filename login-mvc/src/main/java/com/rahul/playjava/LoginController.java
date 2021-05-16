package com.rahul.playjava;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.rahul.playjava.model.User;
import com.rahul.playjava.model.UserRepo;

@Controller
public class LoginController {
	
	@Autowired
	private UserRepo userRepo;

	RestTemplate restTemplate = new RestTemplate();
	
	
	@RequestMapping("/")
	public String checkMvc() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String loginHomePage(@RequestParam("userName") String userName,
								@RequestParam("password") String password, Model model) {
		
		User u = null;
		try {
			u= userRepo.findByName(userName);
		}catch (Exception e) {
			System.out.println("User Not Found....");
		}
		
		if(u!=null) {
				model.addAttribute("UserName",userName);
				return "homePage";
		}
		model.addAttribute("error","User Not Found !!! Kindly Register Properly.....");
		return "login";
	}
	
	@RequestMapping("/register")
	public String goToRegisterPage() {
		
		return "register";
		
	}
	
	@RequestMapping("/set-user")
	public String goToRegisterMicroservice(@RequestParam("userName") String userName,
			@RequestParam("password1") String password1,
			@RequestParam("password2") String password2, Model model) {
		
		if(password1.equals(password2)) {
			restTemplate.getForObject("http://localhost:8990/register-user/"+userName+"/"+password1, String.class);
		
			model.addAttribute("registerSuccess","Registered Successfully !!!");
			return "login";
		}
		else {
			System.out.println("Password Not Matching!!!");
			model.addAttribute("registerError","Password Not Same ");
			}
			return "register";
	}
}
