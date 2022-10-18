package com.food.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.food.models.Review;
import com.food.repositories.ReviewRepository;

@Service
public class ReviewService {
	@Autowired
	private ReviewRepository repo;
	
	public List<Review> allReviews() {
		return repo.findAll();
	}
	
	public Review findReview(Long id) {
		return repo.findById(id).get();
	}
	
	public Review createReview(Review r) {
		return repo.save(r);
	}
	
	public Review updateReview(Review r) {
		Review updateReview = repo.findById(r.getId()).get();
		updateReview.setRestaurant(r.getRestaurant());
		updateReview.setCity(r.getCity());
		updateReview.setState(r.getState());
		updateReview.setDateVisited(r.getDateVisited());
		updateReview.setDish(r.getDish());
		updateReview.setPrice(r.getPrice());
		updateReview.setReview(r.getReview());
		return repo.save(updateReview);
	}
	
	public void deleteReview(Long id) {
		repo.deleteById(id);
	}
}