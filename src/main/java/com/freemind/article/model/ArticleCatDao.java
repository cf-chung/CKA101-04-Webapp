package com.freemind.article.model;

import java.util.List;

public interface ArticleCatDao {
	void insert(ArticleCat articleCat);

	void update(ArticleCat articleCat);

	void delete(Integer categoryId);

	ArticleCat getCategoryById(Integer categoryId);
	
	ArticleCat findByCategoryName(String categoryName);

	List<ArticleCat> getAll();
	
    List<ArticleCat> getAll(int currentPage);
    
    int getCount();
}
