package service;

import dao.IUserDao;
import dao.UserDao;
import model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{

    private IUserDao userDao;

    public UserService(){
        userDao = new UserDao();
    }

    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public void createUser(User user) {
        try {
            userDao.insertUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User findUserById(int id) {
        return userDao.selectUser(id);
    }

    @Override
    public boolean editUser(User user) throws SQLException {
        return userDao.updateUser(user);
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDao.deleteUser(id);
    }

    @Override
    public List<User> findUserByCountry(String country) {
        try {
            return userDao.findUserByCountry(country);
        } catch (SQLException throwables) {
            return null;
        }
    }

    @Override
    public List<User> orderUserByName() throws SQLException {
        return userDao.orderUserByName();
    }

    @Override
    public int countUser() throws SQLException {
        return userDao.count();
    }

    @Override
    public List<User> findFiveUser(int index, int size) throws SQLException {
        return userDao.findFiveUser(index,size);
    }
}
