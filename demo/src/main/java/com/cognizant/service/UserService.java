package com.cognizant.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cognizant.model.User;
import com.cognizant.repository.UserRepo;

@Service
public class UserService {

	@Autowired
	UserRepo repo;
	
	public User saveUser(User user) {
		return repo.save(user);
	}
	
	public User findByUserId(String userId) {
		return repo.findByUserId(userId);
	}
	
	public User findByEmail(String email) {
		return repo.findByEmail(email);
	}
	
	public User updatePassword(User user) {
		User oldUser = repo.findById(user.getId()).orElse(null);
		oldUser.setPassword(user.getPassword());
		return repo.save(oldUser);
	}
	
	public void deleteUser(int id) {
		repo.deleteById(id);
	}
	
}
