package service;

import dao.AbstractDao;
import model.Country;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    AbstractDao conDao = new AbstractDao();

    static final String selectSQL = "{CALL sp_selectAll_User()}";

    static final String insertSQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    static final String getUserByIdSQL = "{CALL sp_getById_User(?)}";

    static final String updateUserSQL = "{CALL sp_update_user(?,?,?,?)}";


    @Override
    public List<User> findAllUser() throws SQLException {
        List<User> userList = new ArrayList<>();
        try (Connection con = conDao.getConnection();
             CallableStatement statement = con.prepareCall(selectSQL);
             ResultSet rs = statement.executeQuery();
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("countryName");

                Country country1 = new Country(country);
                User user = new User(id, name, email, country1);
                userList.add(user);
            }
        }
        return userList;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection connection = conDao.getConnection();
             CallableStatement statement = connection.prepareCall(insertSQL);
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setInt(3, user.getCountry().getId());
            statement.executeUpdate();
        }
    }

    @Override
    public void addUserTransaction(User user, int[] permissions) throws SQLException {
        Connection connection = null;

        PreparedStatement statement = null;

        PreparedStatement pstmAssignment = null;

        ResultSet rs = null;

        try {
            connection = conDao.getConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setInt(3, user.getCountry().getId());

            int rowAffected = statement.executeUpdate();

            rs = statement.getGeneratedKeys();

            int userId = 0;

            if (rs.next()) {
                userId = rs.getInt(1);
            }
            if (rowAffected == 1) {
                String sqlPivot = "INSERT INTO users_permision(user_id,permision_id) VALUES(?,?)";
                pstmAssignment = connection.prepareStatement(sqlPivot);
                for (int permissionId : permissions) {
                    pstmAssignment.setInt(1, userId);
                    pstmAssignment.setInt(2, permissionId);
                    pstmAssignment.executeUpdate();
                }
                connection.commit();
            }else {
                connection.rollback();
            }
        }catch (SQLException ex){
            try {
                if (connection != null) {
                    connection.rollback();
                }
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        }finally {
            try{
                if(rs != null){
                    rs.close();
                }
                if(pstmAssignment != null){
                    pstmAssignment.close();
                }
                if(statement != null){
                    statement.close();
                }
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }
        }
    }

    public User findUserById(int id) throws SQLException {
        User user = null;
        try (Connection connection = conDao.getConnection();
             CallableStatement statement = connection.prepareCall(getUserByIdSQL)
        ) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("id");
                String email = resultSet.getString("email");
                int countryId = resultSet.getInt("country");
                Country country = new Country(countryId);
                user = new User(id, name, email, country);
            }
        }
        return user;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdate;
        try (Connection connection = conDao.getConnection();
             CallableStatement statement = connection.prepareCall(updateUserSQL)
        ) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setInt(3, user.getCountry().getId());
            statement.setInt(4, user.getId());
            rowUpdate = statement.executeUpdate() > 0;
        }
        return rowUpdate;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDelete;
        String deleteUserSQL = "delete from users where id = ?";
        try (Connection connection = conDao.getConnection();
             PreparedStatement statement = connection.prepareStatement(deleteUserSQL);
        ) {
            statement.setInt(1, id);
            rowDelete = statement.executeUpdate() > 0;
        }
        return rowDelete;
    }
}
