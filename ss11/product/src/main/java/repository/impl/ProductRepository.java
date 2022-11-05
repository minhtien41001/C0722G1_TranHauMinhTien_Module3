package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> products = new HashMap<>();

    static {
        products.put(1,new Product(1,"Cafe",30000,"Cà phê xay","Trung Nguyên"));
        products.put(2,new Product(2,"Nước khoáng",10000,"Nước khoáng tinh khiết","Aquafina"));
        products.put(3,new Product(3,"Trà sữa",30000,"Trà sữa truyền thống","Bông"));
        products.put(4,new Product(4,"Sữa chua",5000,"Sữa chua nha đam","Vinamilk"));
        products.put(5,new Product(5,"Trà chanh",15000,"Trà chanh","Chưa nghĩ ra"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item : findAll()){
            if (item.getName().contains(name)){
                searchList.add(item);
            }
        }
        return searchList;
    }
}
