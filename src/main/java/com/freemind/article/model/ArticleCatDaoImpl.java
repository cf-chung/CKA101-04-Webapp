package com.freemind.article.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.freemind.util.HibernateUtil;

public class ArticleCatDaoImpl implements ArticleCatDao{
	private SessionFactory factory;
	
	public ArticleCatDaoImpl() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public void insert(ArticleCat articleCat) {
		Session currentSession = this.getSession();
		currentSession.persist(articleCat);
	}

	@Override
	public void update(ArticleCat articleCat) {
		getSession().merge(articleCat);
	}

	@Override
	public void delete(Integer categoryId) {
		ArticleCat articleCat = getSession().find(ArticleCat.class, categoryId);
		if (articleCat != null) {
			getSession().remove(articleCat);
		}
	}

	@Override
	public ArticleCat getCategoryById(Integer categoryId) {
		return getSession().find(ArticleCat.class, categoryId);
	}

	@Override
	public List<ArticleCat> getAll() {
		return getSession().createQuery("from ArticleCat", ArticleCat.class).getResultList();
	}

}
