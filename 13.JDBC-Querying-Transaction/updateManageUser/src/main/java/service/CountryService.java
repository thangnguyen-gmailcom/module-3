package service;

import dao.AbstractDao;
import model.Country;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryService {

    String selectAllCountry = "{CALL sp_selectAllCountry()}";

    AbstractDao conDao = new AbstractDao();

    public List<Country> selectAllCountry() throws SQLException {
        List<Country> countryList = new ArrayList<>();
        try(Connection connection = conDao.getConnection();
            CallableStatement statement = connection.prepareCall(selectAllCountry);
            ResultSet rs = statement.executeQuery();
        ){
            while (rs.next()){
                int id = rs.getInt("id");
                String countryName = rs.getString("countryName");
                Country country = new Country(id,countryName);
                countryList.add(country);
            }
        }
        return countryList;
    }
}
