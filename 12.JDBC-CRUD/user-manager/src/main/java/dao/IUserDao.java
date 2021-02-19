package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {

    List<User> findAllUser();

    int count() throws SQLException;

    List<User> findFiveUser(int index, int size) throws SQLException;

    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    boolean updateUser(User user) throws SQLException;

    boolean deleteUser(int id) throws SQLException;

    List<User> findUserByCountry(String country) throws SQLException;

    List<User> orderUserByName() throws SQLException;
}
