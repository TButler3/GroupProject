package com.food.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.food.models.LoginUser;
import com.food.models.User;
import com.food.repositories.UserRepository;


@Service
public class UserService {
	@Autowired
    private UserRepository repo;
    
    public User register(User newUser, BindingResult result) {
    	Optional<User> existingUser = repo.findByEmail(newUser.getEmail());
        if(existingUser.isPresent()) {
        	result.rejectValue("email", "Exist", "There is an existing account with this email!");
        	return null;
        }
        else if(!newUser.getPassword().equals(newUser.getConfirm())) {
        	result.rejectValue("confirm", "Matches", "The confirmation password must match with the password!");
        	return null;
        }
        else if(result.hasErrors()) {
        	return null;
        }
    
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return repo.save(newUser);
    }
    
    public User login(LoginUser newLogin, BindingResult result) {
    	Optional<User> potentialUser = repo.findByEmail(newLogin.getEmail());
    	
        if(!potentialUser.isPresent()) {
        	result.rejectValue("email", "Exist", "There is no existing account with that email!");
        	return null;
        }
        User user = potentialUser.get();
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
        	result.rejectValue("password", "Matches", "Invalid password!");
        }
        else if(result.hasErrors()) {
        	return null;
        }
        
        return user;
    }
    
    public User findbyId(Long id) {
    	return repo.findById(id).get();
    }
}