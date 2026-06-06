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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
	
	/***************************************************************
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "psych_id", nullable = false)
	private Psychologist psychologist;
	
	@ManyToOne(fetch = FetchType.LAZY) 
	@JoinColumn(name = "admin_id")
	private Admin admin;
	*/
	
	@Column(name = "psych_id", nullable = false)
	private Integer psychId;
	
	@Column(name = "admin_id")
	private Integer adminId;
	/**************************************************************/
	
	@Column(name = "cover_image", nullable = false)
	private byte[] coverImage;
	
	@Column(name = "title", length = 50, nullable = false)
	private String title;
	
	@Column(name = "article_content", length = 10000)
	private String content;
	
	@Column(name = "created_at", nullable = false)
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
	private LocalDateTime unpublishedAt;
	
	@Column(name = "article_status", nullable = false)
	private Byte articleStatus = 0;
	
	@Column(name = "reject_reason")
	private Byte rejectReason;
	
	@Column(name = "reject_note", length = 200)
	private String rejectNote;
	
	@Column(name = "view_count", nullable = false)
	private Integer viewCount = 0;
	
	@Column(name = "like_count", nullable = false)
	private Integer likeCount = 0;
	
	@Column(name = "save_count", nullable = false)
	private Integer saveCount = 0;
	
	@Column(name = "share_count", nullable = false)
	private Integer shareCount = 0;

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public ArticleCat getArticleCat() {
		return articleCat;
	}

	public void setArticleCat(ArticleCat articleCat) {
		this.articleCat = articleCat;
	}

	public Integer getPsychId() {
		return psychId;
	}

	public void setPsychId(Integer psychId) {
		this.psychId = psychId;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public byte[] getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(byte[] coverImage) {
		this.coverImage = coverImage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public LocalDateTime getSubmittedAt() {
		return submittedAt;
	}

	public void setSubmittedAt(LocalDateTime submittedAt) {
		this.submittedAt = submittedAt;
	}

	public LocalDateTime getReviewedAt() {
		return reviewedAt;
	}

	public void setReviewedAt(LocalDateTime reviewedAt) {
		this.reviewedAt = reviewedAt;
	}

	public LocalDateTime getPublishedAt() {
		return publishedAt;
	}

	public void setPublishedAt(LocalDateTime publishedAt) {
		this.publishedAt = publishedAt;
	}

	public LocalDateTime getUnpublishedAt() {
		return unpublishedAt;
	}

	public void setUnpublishedAt(LocalDateTime unpublishedAt) {
		this.unpublishedAt = unpublishedAt;
	}

	public Byte getArticleStatus() {
		return articleStatus;
	}

	public void setArticleStatus(Byte articleStatus) {
		this.articleStatus = articleStatus;
	}

	public Byte getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(Byte rejectReason) {
		this.rejectReason = rejectReason;
	}

	public String getRejectNote() {
		return rejectNote;
	}

	public void setRejectNote(String rejectNote) {
		this.rejectNote = rejectNote;
	}

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}

	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getSaveCount() {
		return saveCount;
	}

	public void setSaveCount(Integer saveCount) {
		this.saveCount = saveCount;
	}

	public Integer getShareCount() {
		return shareCount;
	}

	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}
	
	
}
