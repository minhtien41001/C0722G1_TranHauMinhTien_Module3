package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    boolean create (Customer customer);

    Customer findById (int idFind);

    boolean edit (Customer customer);

    boolean delete(int idDelete);

    List<Customer> search (String nameSearch, String addressSearch,String phoneSearch);
}
