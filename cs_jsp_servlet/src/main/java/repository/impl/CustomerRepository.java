package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String FIND_ALL= "select * from customer where is_delete = 0;";
    private static final String INSERT = "insert into customer(name,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id)" +
            "values(?,?,?,?,?,?,?,?)";
    private static final String FIND_BY_ID = "select * from customer where id = ? and is_delete = 0";
    private static final String UPDATE = "update customer set name = ?, date_of_birth = ?,gender = ?,id_card = ?,phone_number = ?," +
            "email = ?,address = ?,customer_type_id = ? where id = ? and is_delete = 0; ";
    private static final String DELETE = "update customer set is_delete = 1 where id = ? and is_delete = 0";
    private static final String SEARCH = "select * from customer where is_delete = 0 and name like ? and" +
            "address like ? and phone_number like ?;" ;

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int customerId = resultSet.getInt("id");
                String customerName = resultSet.getString("name");
                String customerBirthday = resultSet.getString("date_of_birth");
                String customerIdCard = resultSet.getString("id_card");
                int customerGender = resultSet.getInt("gender");
                String customerPhone = resultSet.getString("phone_number");
                String customerEmail = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");

                Customer customer = new Customer(customerId,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean create(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setString(1,customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerBirthday());
            preparedStatement.setString(3,customer.getCustomerIdCard());
            preparedStatement.setInt(4,customer.getCustomerGender());
            preparedStatement.setString(5,customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerEmail());
            preparedStatement.setString(7,customer.getCustomerAddress());
            preparedStatement.setInt(8,customer.getCustomerTypeId());

            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer findById(int idFind) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1,idFind);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int customerId = resultSet.getInt("id");
                String customerName = resultSet.getString("name");
                String customerBirthday = resultSet.getString("date_of_birth");
                String customerIdCard = resultSet.getString("id_card");
                int customerGender = resultSet.getInt("gender");
                String customerPhone = resultSet.getString("phone_number");
                String customerEmail = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");

                customer = new Customer(customerId,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean edit(Customer customer) {
        boolean rowUpdate = false;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);

            preparedStatement.setString(1,customer.getCustomerName());
            preparedStatement.setString(2, customer.getCustomerBirthday());
            preparedStatement.setString(3,customer.getCustomerIdCard());
            preparedStatement.setInt(4,customer.getCustomerGender());
            preparedStatement.setString(5,customer.getCustomerPhone());
            preparedStatement.setString(6, customer.getCustomerEmail());
            preparedStatement.setString(7,customer.getCustomerAddress());
            preparedStatement.setInt(8,customer.getCustomerTypeId());
            preparedStatement.setInt(9,customer.getCustomerId());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public boolean delete(int idDelete) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,idDelete);
            rowDelete = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public List<Customer> search(String nameSearch, String addressSearch, String phoneSearch) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%" + nameSearch + "%");
            preparedStatement.setString(2,"%" + addressSearch + "%");
            preparedStatement.setString(3,"%" + phoneSearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int customerId = resultSet.getInt("id");
                String customerName = resultSet.getString("name");
                String customerBirthday = resultSet.getString("date_of_birth");
                String customerIdCard = resultSet.getString("id_card");
                int customerGender = resultSet.getInt("gender");
                String customerPhone = resultSet.getString("phone_number");
                String customerEmail = resultSet.getString("email");
                String customerAddress = resultSet.getString("address");
                int customerTypeId = resultSet.getInt("customer_type_id");

                Customer customer = new Customer(customerId,customerName,customerBirthday,customerGender,customerIdCard,customerPhone,customerEmail,customerAddress,customerTypeId);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }
}
