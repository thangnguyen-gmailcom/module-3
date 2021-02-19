package Controller;

import model.Country;
import model.User;
import service.CountryService;
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

@WebServlet(name = "UserServlet", urlPatterns = "/view")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();
    CountryService countryService = new CountryService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createUser(request,response);
                break;
            case "edit":
                editUser(request,response);
            default:
                listUser(request,response);
                break;
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int countryId = Integer.parseInt(request.getParameter("countryName"));

        Country country = new Country(countryId);

        User user = new User(id, name , email, country);

        try {
            userService.updateUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("user",user);
        request.setAttribute("message","Successful editing !");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        dispatcher.forward(request,response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int countryId = Integer.parseInt(request.getParameter("countryName"));
        Country country = new Country(countryId);
        User user = new User(name,email,country);
        List<Country> countryList = null;
        try {
            userService.insertUser(user);
            countryList = countryService.selectAllCountry();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("user",user);
        request.setAttribute("countrys", countryList);
        request.setAttribute("mess","success !");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUserForm(request,response);
                break;
            case "edit":
                editUserForm(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            case "permision":
                addUserPermision(request,response);
                break;
            default:
                listUser(request, response);
        }
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("thanh", "hai@gmail.com",new Country(1));
        int[] permission = {1,2,4};
        try {
            userService.addUserTransaction(user,permission);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            userService.deleteUser(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        List<User> users = null;
        try {
            users = userService.findAllUser();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("users",users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/listUser.jsp");
        dispatcher.forward(request,response);

    }

    private void editUserForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Country> countryList= null;
        User user = null;
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            user = userService.findUserById(id);
            countryList = countryService.selectAllCountry();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("user",user);
        request.setAttribute("countrys",countryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        dispatcher.forward(request,response);
    }

    private void createUserForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Country> countries = null;
        try {
            countries = countryService.selectAllCountry();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("countrys", countries);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        dispatcher.forward(request,response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = null;
        try {
            users = userService.findAllUser();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/listUser.jsp");
        dispatcher.forward(request, response);
    }
}
