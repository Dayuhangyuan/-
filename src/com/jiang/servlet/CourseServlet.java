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
import com.jiang.entity.Student;
import com.jiang.entity.Teacher;
import com.jiang.entity.Course;
import com.jiang.utils.MD5;
import com.jiang.utils.PageInfo;
import com.jiang.utils.PathUtils;

@WebServlet("/course")
public class CourseServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("list".equals(method)) {
			this.list(request, response);
		}
		else if("add".equals(method)) {
			this.add(request, response);
		}
		else if("v_add".equals(method)) {
			this.v_add(request, response);
		}
		else if("edit".equals(method)) {
			this.findById(request, response);
		}
		else if("editsubmit".equals(method)) {
			this.editsubmit(request, response);
		}
		else if("delete".equals(method)) {
			this.delete(request, response);
		}
		
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		try {
			DaoFactory.getInstance().getCourseDao().delete(Integer.parseInt(id));
			//直接重定向到列表页面
			response.sendRedirect(PathUtils.getBasePath(request)+"course?method=list");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	//提交修改选课
	private void editsubmit(HttpServletRequest request, HttpServletResponse response) {
		String cName = request.getParameter("cName");
		Integer cId = getIntParameter(request, "cId");
		Integer tId = Integer.parseInt(request.getParameter("tId"));
		String cTime=request.getParameter("cTime");
		String cPlace=request.getParameter("cPlace");
		String week = request.getParameter("week");
		Course course = new Course();
		course.setcId(cId);
		course.setcName(cName);
		course.setcTime(cTime);
		course.setcPlace(cPlace);
		course.setWeek(week);
		//new一个Teacher对象，然后设置ID，然后再设置course对象的setTeacher关联 一下即可
		Teacher teacher = new Teacher();
		teacher.settId(tId);
		course.setTeacher(teacher);
		
		try {
			DaoFactory.getInstance().getCourseDao().update(course);
			//直接重定向到列表页面
			//list方法，显示列表
			response.sendRedirect(PathUtils.getBasePath(request)+"course?method=list");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void findById(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		PageInfo<Teacher> pageInfo = new PageInfo<>(1);
		pageInfo.setPageSize(1000);
		try {
			Course course = DaoFactory.getInstance().getCourseDao().findById(Integer.parseInt(id));
			pageInfo = DaoFactory.getInstance().getTeacherDao().list(null, pageInfo);
			request.setAttribute("course", course);
			request.setAttribute("teachers", pageInfo.getList());
			request.getRequestDispatcher("page/course/update.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	private void v_add(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException  {
		PageInfo<Teacher> pageInfo = new PageInfo<>(1);
		pageInfo.setPageSize(1000);
		try {
			pageInfo = DaoFactory.getInstance().getTeacherDao().list(null, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("teachers", pageInfo.getList());
		request.getRequestDispatcher("page/course/add.jsp").forward(request, response);
	}
	
	//管理员新增课程
	private void add(HttpServletRequest request, HttpServletResponse response) {
		String cName = request.getParameter("cName");
		Integer tId = Integer.parseInt(request.getParameter("tId"));
		String cTime=request.getParameter("cTime");
		String cPlace=request.getParameter("cPlace");
		String week = request.getParameter("week");
		Course course = new Course();
		course.setcName(cName);
		//new一个Teacher对象，然后设置ID，然后再设置course对象的setTeacher关联 一下即可
		Teacher teacher = new Teacher();
		teacher.settId(tId);
		course.setTeacher(teacher);
		course.setWeek(week);
		course.setcPlace(cPlace);
		course.setcTime(cTime);
		try {
			DaoFactory.getInstance().getCourseDao().add(course);
			//直接重定向到列表页面
			response.sendRedirect(PathUtils.getBasePath(request)+"course?method=list");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void list(HttpServletRequest request, HttpServletResponse response) {
		//当前页码
		Integer pageNo = getIntParameter(request, "pageNo");
		//查询条件
		Integer cId = getIntParameter(request, "cId");
		String cName = request.getParameter("cName");
		String tName = request.getParameter("tName");
		String userName = request.getParameter("userName");
		String cTime=request.getParameter("cTime");
		String cPlace=request.getParameter("cPlace");
		
		Course course = new Course();
		course.setcId(cId);
		course.setcName(cName);
		course.setcTime(cTime);
		course.setcPlace(cPlace);
		Teacher teacher = new Teacher();
		teacher.settName(tName);
		teacher.setUserName(userName);
		course.setTeacher(teacher);
		
		//构造了一个pageInfo对象
		PageInfo<Course> pageInfo = new PageInfo<>(pageNo);
		try {
			pageInfo = DaoFactory.getInstance().getCourseDao().list(course,pageInfo);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			request.setAttribute("pageInfo", pageInfo);
			//回写到页面
			request.setAttribute("course", course);
			request.getRequestDispatcher("page/course/list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Integer getIntParameter(HttpServletRequest request,String name) {
		if(StringUtils.isNoneBlank(request.getParameter(name))) {
			return Integer.parseInt(request.getParameter(name));
		}else {
			return null;
		}
	}
}
