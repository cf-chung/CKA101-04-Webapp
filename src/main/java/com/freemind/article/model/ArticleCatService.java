package com.freemind.article.model;

import static com.freemind.util.Constants.PAGE_SIZE;

import java.util.List;

public class ArticleCatService {
	private ArticleCatDao articleCatDao;

	public ArticleCatService() {
		articleCatDao = new ArticleCatDaoImpl();
	}

	public ArticleCat addArticleCat(String categoryName) {
		ArticleCat existingCat = articleCatDao.findByCategoryName(categoryName);
		if (existingCat != null) {
			throw new IllegalArgumentException("分類名稱已存在: " + categoryName);
		}
		
		ArticleCat articleCat = new ArticleCat();
		articleCat.setCategoryName(categoryName);
		articleCatDao.insert(articleCat);
		return articleCat;
	}

	public ArticleCat updateArticleCat(Integer categoryId, String categoryName) {
		ArticleCat existingCat = articleCatDao.findByCategoryName(categoryName);
		if (existingCat != null && !existingCat.getCategoryId().equals(categoryId)) {
			throw new IllegalArgumentException("分類名稱已存在: " + categoryName);
		}
		
		ArticleCat articleCat = articleCatDao.getCategoryById(categoryId);
		if (articleCat != null) {
			articleCat.setCategoryName(categoryName);
			articleCatDao.update(articleCat);
		}
		
		return articleCat;
	}

	public void deleteArticleCat(Integer categoryId) {
		articleCatDao.delete(categoryId);
	}

	public ArticleCat getArticleCat(Integer categoryId) {
		return articleCatDao.getCategoryById(categoryId);
	}

	public List<ArticleCat> getAll() {
		return articleCatDao.getAll();
	}
	
	public List<ArticleCat> getAll(int currentPage) {
	    return articleCatDao.getAll(currentPage);
	}
	
	public int getPageTotal() {
	    int total = articleCatDao.getCount();
	    return (int) Math.ceil((double)total / PAGE_SIZE); 
	}

}
