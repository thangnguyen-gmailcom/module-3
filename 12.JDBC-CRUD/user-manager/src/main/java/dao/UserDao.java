package dao;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements IUserDao {

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/demo";
            String user = "root";
            String password = "123123";
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }


    @Override
    public List<User> findAllUser() {
        List<User> result = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (
                Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                result.add(user);
            }
            return result;
        } catch (SQLException e) {
            return null;
        }
    }

    @Override
    public int count() throws SQLException {
        String countSQL = "SELECT COUNT(*) FROM users";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(countSQL);
             ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }
        return 0;
    }

    @Override
    public List<User> findFiveUser(int index, int size) throws SQLException {
        List<User> list = new ArrayList<>();
        String findFiveUserSQL = "WITH x AS( SELECT * , ROW_NUMBER() OVER (ORDER BY id) AS rowUser FROM users)\n" +
                "SELECT * FROM x WHERE rowUser BETWEEN ? * ? - (? -1)AND ? * ? ";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(findFiveUserSQL);
        ) {
            statement.setInt(1, index);
            statement.setInt(2, size);
            statement.setInt(3,size);
            statement.setInt(4,index);
            statement.setInt(5,size);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String email = resultSet.getString(3);
                String country = resultSet.getString(4);
                User user = new User(id, name, email, country);
                list.add(user);
            }
        }
        return list;
    }


    @Override
    public void insertUser(User user) throws SQLException {
        String insertUserSQL = "INSERT INTO users(name,email,country) VALUE(?,?,?)";
        try (
                Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(insertUserSQL);
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        String selectUserSQL = "SELECT * FROM users WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(selectUserSQL);
        ) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        String updateUserSQL = "UPDATE users " +
                "SET name = ?, email = ?, country = ?" +
                "WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(updateUserSQL)
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            rowUpdate = statement.executeUpdate() > 0;
        }
        return rowUpdate;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        String deleteUserSQL = "delete from users where id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(deleteUserSQL);
        ) {
            statement.setInt(1, id);
            rowDelete = statement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    @Override
    public List<User> findUserByCountry(String country) throws SQLException {
        List<User> userList = new ArrayList<>();
        String findUserByCountrySQL = "SELECT * FROM users WHERE country = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(findUserByCountrySQL);
        ) {
            statement.setString(1, country);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        }
        return userList;
    }

    @Override
    public List<User> orderUserByName() throws SQLException {
        List<User> userList = new ArrayList<>();
        String orderBySQL = "SELECT * FROM users ORDER By users.name DESC";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(orderBySQL);
             ResultSet resultSet = statement.executeQuery();
        ) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                userList.add(user);
            }
        }
        return userList;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
