package com.food.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.food.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {
	List<Review> findAll();
	List<Review> findByUserId(Long id);
}
