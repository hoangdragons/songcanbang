package com.dolphin.cmscore.dto;

public class CouseInformationForPaymentDto {
	
	private String title;
	private double price;
	private Long totalLesson;
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Long getTotalLesson() {
		return totalLesson;
	}

	public void setTotalLesson(Long totalLesson) {
		this.totalLesson = totalLesson;
	}
	
}
