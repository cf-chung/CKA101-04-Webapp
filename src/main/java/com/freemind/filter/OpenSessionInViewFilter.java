package com.freemind.filter;

import java.io.IOException;

import org.hibernate.SessionFactory;

import com.freemind.util.HibernateUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter("/*")
public class OpenSessionInViewFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		try {
			System.out.println("Filter open transaction");
			factory.getCurrentSession().beginTransaction();
			chain.doFilter(req, res);
			factory.getCurrentSession().getTransaction().commit();
		} catch (Exception e) {
			factory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			chain.doFilter(req, res);
		}
	}

}
