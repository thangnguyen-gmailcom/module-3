package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {

    List<User> findAllUser() throws SQLException;

    void insertUser(User user) throws SQLException;

    void addUserTransaction(User user, int[] permissions) throws SQLException;
}
