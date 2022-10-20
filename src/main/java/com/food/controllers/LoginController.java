package com.food.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.food.models.LoginUser;
import com.food.models.Review;
import com.food.models.User;
import com.food.services.ReviewService;
import com.food.services.UserService;

@Controller
public class LoginController {
    @Autowired
    private UserService userServ;
    @Autowired
    private ReviewService reviewServ;
    
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
    }
    
    @GetMapping("/register")
    public String newRegister(Model model) {
    	model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "register.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
    	
    	userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "register.jsp";
        }
        
        session.setAttribute("id", newUser.getId());
    
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }
        
        session.setAttribute("id", user.getId());
        
        return "redirect:/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	if(session.getAttribute("id") == null) {
    		return "redirect:/";
    	}
    	
    	List<Review> reviews = reviewServ.allReviews();
    	model.addAttribute("reviews", reviews);
    	
    	User user = userServ.findbyId((Long) session.getAttribute("id"));
    	model.addAttribute("user", user);
    	
        return "dashboard.jsp";
    }
    
    @GetMapping("/review/new")
    public String newReview(HttpSession session, @ModelAttribute("review") Review review, Model model) {
    	System.out.println(session.getAttribute("id"));
    	if(session.getAttribute("id") == null) {
    		return "redirect:/";
    	} else {
        	User user = userServ.findbyId((Long) session.getAttribute("id"));
        	model.addAttribute("user", user);
    		return "addReview.jsp";
    	}
    }
    
    @PostMapping("/reviews/add")
    public String createReview(@Valid @ModelAttribute("review") Review review,
    		BindingResult result) {
    	System.out.println(result.getAllErrors());
    	if(result.hasErrors()) {
    		
    		return "addReview.jsp";
    	} else {
    		reviewServ.createReview(review);
    		return "redirect:/dashboard";
    	}
    }
    
    @GetMapping("/review/{id}")
    public String oneReview(@PathVariable Long id,
    		Model model, HttpSession session) {
    	if(session.getAttribute("id") == null) {
    		return "redirect:/";
    	} else {
    		Review oneReview = reviewServ.findReview(id);
    		model.addAttribute("review", oneReview);
        	User user = userServ.findbyId((Long) session.getAttribute("id"));
        	model.addAttribute("user", user);
    		return "singleReview.jsp";
    	}
    }
    
    @GetMapping("/edit/{id}")
    public String editReview(@PathVariable Long id,
    		HttpSession session,
    		@ModelAttribute("editReview") Review review,
    		Model model) {
    	if(session.getAttribute("id") == null) {
    		return "redirect:/";
    	} else {
    		Review oneReview = reviewServ.findReview(id);
    		model.addAttribute("review", oneReview);
        	User user = userServ.findbyId((Long) session.getAttribute("id"));
        	model.addAttribute("user", user);
    		return "editReview.jsp";
    	}
    }
    
    @PutMapping("/reviews/{id}/update")
    public String updateReview(@Valid @ModelAttribute("review") Review review,
    		BindingResult result) {
    	if(result.hasErrors()) {
    		return "editReview.jsp";
    	} else {
    		reviewServ.updateReview(review);
    		return "redirect:/dashboard";
    	}
    }
    
    @GetMapping("/reviews/user/{id}")
    public String userReviews(@PathVariable Long id, HttpSession session, Model model) {
    	if(session.getAttribute("id") == null) {
    		return "redirect:/";
    	} else {
    		List<Review> reviews = reviewServ.allReviewsByUserId(id);
        	model.addAttribute("reviews", reviews);
        	
        	User user = userServ.findbyId((Long) session.getAttribute("id"));
        	model.addAttribute("user", user);
        	
            return "dashboard.jsp";
    	}
    }
    
    @DeleteMapping("/delete/{id}")
    public String deleteReview(@PathVariable Long id,
    		HttpSession session) {
    	if(session.getAttribute("id") == null) {
    		return "redirect:/";
    	} else {
    		reviewServ.deleteReview(id);
    		return "redirect:/dashboard";
    	}
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}
