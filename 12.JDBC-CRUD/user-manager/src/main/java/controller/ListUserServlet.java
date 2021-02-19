package controller;

import model.User;
import service.IUserService;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListUserServlet", urlPatterns = "/")
public class ListUserServlet extends HttpServlet {

    IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        int pageStart =1;
        List<User> users = null;
        if(page!= null){
            int back = Integer.parseInt(page);
            if(back == 0 | back == 1){
                back = 1;
            }else {
                back = Integer.parseInt(page)-1;
            }
        request.setAttribute("back",back);
        }
        if(page!=null){
            try {
                pageStart= Integer.parseInt(page);
                users = userService.findFiveUser(Integer.parseInt(page),5);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }else {
            try {
                users = userService.findFiveUser(1, 5);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        request.setAttribute("users", users);
        try {
            int count = userService.countUser();
            int pageSize = 1;
            int endPage = 0;
            endPage = count / pageSize;
            if(count % pageSize != 0){
                endPage++;
            }
            boolean isDotDot = false;
            if(endPage-pageStart>3){
                endPage = pageStart+3;
                isDotDot = true;
            }
            request.setAttribute("isDotDot",isDotDot);
            request.setAttribute("start",pageStart);
            request.setAttribute("end",endPage);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-user.jsp");
        dispatcher.forward(request,response);
    }
}
