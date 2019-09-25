package servlet;

import dao.AdminDao;
import dao.EnterpriseDao;
import dao.StudentDAO;
import entity.Admin;
import entity.Enterprise;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        switch (role){
            case "1":
                StudentDAO studentDao = new StudentDAO();
                Student student = studentDao.findUser(username,password);
                if (student != null){
                    HttpSession studentSession = request.getSession();
                    studentSession.setAttribute("student",student);

//                    request.getRequestDispatcher("home.jsp").forward(request,response);
                    request.getRequestDispatcher("/ShowServlet?stu_id="+student.getStu_id()).forward(request,response);
                }else {
                    request.setAttribute("err","用户名或者密码错误");
                    request.getRequestDispatcher("/login.jsp").forward(request,response);
                }
                break;
            case "2":
                EnterpriseDao enterpriseDao = new EnterpriseDao();
                Enterprise enterprise = enterpriseDao.loginFind(username,password);
                if (enterprise != null){
                    HttpSession enterpriseSession = request.getSession();
        enterpriseSession.setAttribute("enterprise",enterprise);

        request.getRequestDispatcher("/FindEnterpriseDataServlet?id="+enterprise.getEnterprise_id()).forward(request,response);
        }else {
        request.setAttribute("err","用户名或者密码错误");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        break;
        case "3":
        AdminDao adminDao = new AdminDao();
        Admin admin = adminDao.loginFind(username,password);
        if (admin != null){
        HttpSession adminSession = request.getSession();
        adminSession.setAttribute("admin",admin);

            System.out.println("adminadminadminadminadminadminadminadminadmin");
            System.out.println(adminSession.getAttribute("admin"));
            System.out.println(adminSession.getAttribute("admin").toString().replace(",", "#").replace(" ", ""));

        request.getRequestDispatcher("/dologin.jsp").forward(request,response);
        }else {
        request.setAttribute("err","用户名或者密码错误");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
        break;
default:
        request.setAttribute("err","登录错误，请重新登陆");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        break;
        }
        }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
        }
        }
