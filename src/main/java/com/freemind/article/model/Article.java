package com.freemind.article.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "articles")
public class Article implements java.io.Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "article_id")
	private Integer articleId;
	
	@ManyToOne(fetch = FetchType.LAZY) // default: Eager Loading 
	@JoinColumn(name = "article_cat_id", nullable = false)
	private ArticleCat articleCat;
	
	/*
	@ManyToOne(fetch = FetchType.LAZY)
	@Column(name = "psych_id", nullable = false)
	private Psychologist psychologist;
	
	@ManyToOne(fetch = FetchType.LAZY) 
	@JoinColumn(name = "admin_id")
	private Admin admin;
	
	
	@Column(name = "cover_image", nullable = false)
	private byte[] coverImage;
	
	@Column(name = "title", length = 50, nullable = false)
	private String title;
	
	@Column(name = "article_content")
	private String content;
	
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;

	@Column(name = "submitted_at")
	private LocalDateTime submittedAt;
	
	@Column(name = "reviewed_at")
	private LocalDateTime reviewedAt;
	
	@Column(name = "published_at")
	private LocalDateTime publishedAt;
	
	@Column(name = "unpublished_at")
	private LocalDateTime unPublishedAt;
	
	@Column(name = "article_status")
	private Integer articleStatus;
	
	@Column(name = "reject_reason")
	private String rejectReason;
	
	@Column(name = "reject_note")
	private String rejectNote;
	
	@Column(name = "view_count")
	private Integer viewCount;
	
	@Column(name = "like_count")
	private Integer likeCount;
	
	@Column(name = "save_count")
	private Integer saveCount;
	
	@Column(name = "share_count")
	private Integer shareCount;
*/
}
