package service;


import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> findAllUser();

    void createUser(User user);

    User findUserById(int id);

    boolean editUser(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    List<User> findUserByCountry(String country) throws SQLException;

    List<User> orderUserByName() throws SQLException;

    int countUser() throws SQLException;

    List<User> findFiveUser(int index, int size) throws SQLException;
}
