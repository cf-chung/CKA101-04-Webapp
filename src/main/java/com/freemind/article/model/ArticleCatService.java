package com.freemind.article.model;

import java.util.List;

public class ArticleCatService {
	private ArticleCatDao articleCatDao;

	public ArticleCatService() {
		articleCatDao = new ArticleCatDaoImpl();
	}

	public ArticleCat addArticleCat(String categoryName) {
		ArticleCat articleCat = new ArticleCat();
		articleCat.setCategoryName(categoryName);
		// 檢查名稱是否重複、敏感字過濾等商業邏輯

		articleCatDao.insert(articleCat);
		return articleCat;
	}

	public ArticleCat updateArticleCat(Integer categoryId, String categoryName) {
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
		// Pagination 分頁邏輯
		return articleCatDao.getAll();
	}

}
