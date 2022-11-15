package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    boolean create (Customer customer);

    Customer findById (int idFind);

    boolean edit (Customer customer);

    boolean delete(int idDelete);

    List<Customer> search (String nameSearch, String addressSearch,String phoneSearch);
}
