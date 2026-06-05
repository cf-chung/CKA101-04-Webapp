package com.freemind.article.model;

import java.util.List;

public interface ArticleCatDao {
	void insert(ArticleCat articleCat);

	void update(ArticleCat articleCat);

	void delete(Integer categoryId);

	ArticleCat getCategoryById(Integer categoryId);

	List<ArticleCat> getAll();
}
