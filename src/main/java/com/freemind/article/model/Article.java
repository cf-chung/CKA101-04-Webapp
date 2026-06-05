package com.freemind.article.model;

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
	
}
