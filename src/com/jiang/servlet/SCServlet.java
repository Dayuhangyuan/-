package com.jiang.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.lang3.StringUtils;

import com.jiang.dao.DaoFactory;
import com.jiang.entity.Student;
import com.jiang.entity.Teacher;
import com.jiang.entity.Course;
import com.jiang.entity.Sc;
import com.jiang.utils.MD5;
import com.jiang.utils.PageInfo;
import com.jiang.utils.PathUtils;
import com.jiang.utils.PropertiesUtils;

@WebServlet("/sc")
public class SCServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("select".equals(method)) {
			this.select(request, response);
		}else if("submit".equals(method)) {
			this.submit(request, response);
		}else if("tc".equals(method)) {
			this.teacher_course(request, response);
		}else if("cs".equals(method)) {
			this.course_student(request, response);
		}else if("score_submit".equals(method)) {
			this.score_submit(request, response);
		}
		
	}
	//评分提交
	private void score_submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer cId = getIntParameter(request, "cId");
		String[] stuIdArr = request.getParameterValues("stuId");
		String[] scoreArr = request.getParameterValues("score");
		try {
			DaoFactory.getInstance().getScDao().update(stuIdArr, scoreArr, cId);
			response.sendRedirect(PathUtils.getBasePath(request)+"sc?method=cs&cId="+cId+"&msg=1");
		} catch (SQLException e) {
			response.sendRedirect(PathUtils.getBasePath(request)+"sc?method=cs&cId="+cId+"&msg=0");
			e.printStackTrace();
		}
	}
	//选课的学生查询
	private void course_student(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获取cid的参数
		Integer cId = getIntParameter(request, "cId");
		//2、获取学生列表
		try {
			List<Student> list = DaoFactory.getInstance().getScDao().listStudentByCId(cId);
			request.setAttribute("list", list);
			request.setAttribute("cId", cId);
			request.getRequestDispatcher("page/sc/course_student.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//3、return页面
		
	}
	
	private void teacher_course(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1、获取老师的session中对象tId
		Teacher teacher =(Teacher)request.getSession().getAttribute("user");
		Integer pageNo = getIntParameter(request, "pageNo");
		Course course = new Course();
		course.setTeacher(teacher);
		PageInfo<Course> pageInfo = new PageInfo<>(pageNo);
		//2、查询所教课程列表
		try {
			pageInfo = DaoFactory.getInstance().getCourseDao().list(course, pageInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//3、将信息返回到jsp页面
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("page/sc/teacher_course.jsp").forward(request, response);
	}
	
	
	//保存选课
	private void submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] cIds = request.getParameterValues("cId");
		if (cIds == null || cIds.length == 0) {
			response.sendRedirect(PathUtils.getBasePath(request)+"sc?method=select&msg=2");
			return;
		}
		List<Course> courceList = new ArrayList<>();
		List<Integer> cIdArray = new ArrayList<Integer>();
		//查找选择课程是否冲突
		for (String id : cIds) {
			Course c = null;
			try {
				c = DaoFactory.getInstance().getCourseDao().findById(Integer.parseInt(id));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			courceList.add(c);
			cIdArray.add(Integer.parseInt(id));
		}
		for (Course cource : courceList) {
			String time = cource.getcTime();
			String place = cource.getcPlace();
			String week = cource.getWeek();
			for (Course temp : courceList) {
				if (cource.getcId() != temp.getcId() && time.equals(temp.getcTime()) && week.equals(temp.getWeek())){
					response.sendRedirect(PathUtils.getBasePath(request)+"sc?method=select&msg=3");
					return;
				}
			}
		}
		Student student = (Student)request.getSession().getAttribute("user");
		List<Integer> existScId = new ArrayList<>();
		List<Integer> addList = new ArrayList<>(cIdArray);
		try {
			List<Sc> scourceList = DaoFactory.getInstance().getScDao().listByStuId(student.getStuId());
			for (Sc sc : scourceList) {
				existScId.add(sc.getcId());
			}
			List<Integer> deleteList = new ArrayList<>(existScId);
			
			//delteArr = existScId - cIdArray
			deleteList.removeAll(cIdArray);
			//addList = cIdArray - existScId;
			addList.removeAll(existScId);
			int[] arr = DaoFactory.getInstance().getScDao().add(deleteList,addList, student.getStuId());
			response.sendRedirect(PathUtils.getBasePath(request)+"sc?method=select&msg=1");
		} catch (SQLException e) {
			response.sendRedirect(PathUtils.getBasePath(request)+"sc?method=select&msg=0");
		}
	}
	//选课跳转
	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo<Course> info = new PageInfo<>(1);
		info.setPageSize(1000);
		try {
			info = DaoFactory.getInstance().getCourseDao().list(null, info);
			//获取登录的学生信息
			Student student = (Student)request.getSession().getAttribute("user");
			//获取已选课的课程ID(cId)
			List<Sc> list = DaoFactory.getInstance().getScDao().listByStuId(student.getStuId());
			request.setAttribute("scs",list);
			request.setAttribute("courses", info.getList());
			request.getRequestDispatcher("page/sc/select.jsp").forward(request, response);
		} catch (SQLException e) {
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