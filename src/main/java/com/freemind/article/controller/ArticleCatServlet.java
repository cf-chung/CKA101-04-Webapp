package com.freemind.article.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import com.freemind.article.model.ArticleCat;
import com.freemind.article.model.ArticleCatService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/articleCat/articleCat.do")
public class ArticleCatServlet extends HttpServlet {
	private ArticleCatService articleCatService;

	@Override
	public void init() throws ServletException {
		articleCatService = new ArticleCatService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		String action = req.getParameter("action");
		String forwardPath = "";

		switch (action) {
		case "getOne":
			getOne(req, res);
			return;
		case "getAll":
			forwardPath = getAll(req, res);
			break;
		case "add":
			addArticleCat(req, res);
			return;
		case "toUpdate":
			forwardPath = toUpdate(req);
			break;
		case "update":
			updateArticleCat(req, res);
			return;
		case "delete":
			deleteArticleCat(req, res);
			return;
		default:
			forwardPath = "/articleCat/index.jsp";
		}

		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}

	private void getOne(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);

		// Check if the Id format is correct
		Integer categoryId = null;
		try {
			categoryId = Integer.parseInt(req.getParameter("categoryId")); // 讓 parseInt 處理 null、空字串、非數字三種異常
		} catch (Exception e) {
			errorMsgs.add("分類ID格式不正確");
			req.getRequestDispatcher("/articleCat/listOneArticleCat.jsp").forward(req, res);
			return;
		}

		// Check if the ID exists
		ArticleCat articleCat = articleCatService.getArticleCat(categoryId);
		if (articleCat == null) {
			errorMsgs.add("查無此分類ID：" + categoryId);
			req.getRequestDispatcher("/articleCat/listOneArticleCat.jsp").forward(req, res);
			return;
		}

		req.setAttribute("articleCat", articleCat);
		req.getRequestDispatcher("/articleCat/listOneArticleCat.jsp").forward(req, res);
	}

	private String getAll(HttpServletRequest req, HttpServletResponse res) {
		String page = req.getParameter("page");
		int currentPage = (page == null) ? 1 : Integer.parseInt(page);

		List<ArticleCat> allArticleCats = articleCatService.getAll(currentPage);
		req.setAttribute("allArticleCats", allArticleCats);
		req.setAttribute("currentPage", currentPage);

		if (req.getSession().getAttribute("articleCatPageQty") == null) {
			int pageQty = articleCatService.getPageTotal();
			req.getSession().setAttribute("articleCatPageQty", pageQty);
		}

		return "/articleCat/listAllArticleCats.jsp";
	}

	private void addArticleCat(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);

		String categoryName = req.getParameter("categoryName");
		if (categoryName == null || categoryName.trim().length() == 0) {
			errorMsgs.add("請輸入文章分類名稱");
		}

		if (!errorMsgs.isEmpty()) {
			req.getRequestDispatcher("/articleCat/addArticleCat.jsp").forward(req, res);
			return;
		}

		articleCatService.addArticleCat(categoryName.trim());
		res.sendRedirect(req.getContextPath() + "/articleCat/articleCat.do?action=getAll");
	}

	private String toUpdate(HttpServletRequest req) {
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);

		Integer categoryId = null;
		try {
			categoryId = Integer.parseInt(req.getParameter("categoryId"));
		} catch (Exception e) {
			errorMsgs.add("分類ID格式不正確");
			return "/articleCat/updateArticleCat.jsp";
		}

		ArticleCat articleCat = articleCatService.getArticleCat(categoryId);
		if (articleCat == null) {
			errorMsgs.add("查無此分類ID：" + categoryId);
			return "/articleCat/updateArticleCat.jsp";
		}

		req.setAttribute("articleCat", articleCat);
		return "/articleCat/updateArticleCat.jsp";
	}

	private void updateArticleCat(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);

		Integer categoryId = null;
		try {
			categoryId = Integer.parseInt(req.getParameter("categoryId"));
		} catch (Exception e) {
			errorMsgs.add("分類ID格式不正確");
			req.getRequestDispatcher("/articleCat/updateArticleCat.jsp").forward(req, res);
			return;
		}

		ArticleCat articleCat = articleCatService.getArticleCat(categoryId);
		if (articleCat == null) {
			errorMsgs.add("查無此分類ID：" + categoryId);
			req.getRequestDispatcher("/articleCat/updateArticleCat.jsp").forward(req, res);
			return;
		}

		// Check the input name
		String categoryName = req.getParameter("categoryName");
		if (categoryName == null || categoryName.trim().length() == 0) {
			errorMsgs.add("請輸入文章分類名稱");
			req.getRequestDispatcher("/articleCat/updateArticleCat.jsp").forward(req, res);
			return;
		}

		articleCatService.updateArticleCat(categoryId, categoryName.trim());
		res.sendRedirect(req.getContextPath() + "/articleCat/articleCat.do?action=getAll");
	}

	private void deleteArticleCat(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		List<String> errorMsgs = new LinkedList<>();
		req.setAttribute("errorMsgs", errorMsgs);

		Integer categoryId = null;
		try {
			categoryId = Integer.parseInt(req.getParameter("categoryId"));
		} catch (Exception e) {
			errorMsgs.add("分類ID格式不正確");
			req.getRequestDispatcher("/articleCat/listAllArticleCats.jsp").forward(req, res);
			return;
		}

		ArticleCat articleCat = articleCatService.getArticleCat(categoryId);
		if (articleCat == null) {
			errorMsgs.add("查無此分類ID：" + categoryId);
			req.getRequestDispatcher("/articleCat/listAllArticleCats.jsp").forward(req, res);
			return;
		}

		articleCatService.deleteArticleCat(categoryId);
		res.sendRedirect(req.getContextPath() + "/articleCat/articleCat.do?action=getAll");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
