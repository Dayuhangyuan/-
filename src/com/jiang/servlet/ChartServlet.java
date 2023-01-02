package com.jiang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.jiang.dao.DaoFactory;
import com.jiang.entity.Sc;
import com.jiang.entity.Course;
import com.jiang.entity.Student;
import com.jiang.utils.MD5;
import com.jiang.utils.PageInfo;
import com.jiang.utils.PathUtils;

@WebServlet("/chart")
public class ChartServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("======ChartServlet========");
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");
		if("admin".equals(method)) {
			this.admin(request, response);
		}else if("teacher".equals(method)) {
		}
	}
	
	private void admin(HttpServletRequest request, HttpServletResponse response) {
		try {
			//直接重定向到列表页面
			//request.getRequestDispatcher("main.jsp").forward(request, response);
			response.sendRedirect(PathUtils.getBasePath(request)+"main");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
