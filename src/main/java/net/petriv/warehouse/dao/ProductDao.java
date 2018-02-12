package net.petriv.warehouse.dao;

import net.petriv.warehouse.model.Product;
import java.util.List;

public class ProductDao extends AbstractDao<Product> implements GeneralDao<Product> {

    public ProductDao() {
        super.setClazz(Product.class);
    }

    @Override
    public void save(Product product) {
        saveOne(product);
    }

    @Override
    public Product getById(long id) {
        return findOne(id);
    }

    @Override
    public List<Product> getAll() {
        return findAll();
    }

    @Override
    public void delete(long id) {
        deleteOne(id);
    }

    @Override
    public void update(Product product) {
        updateOne(product);
    }
}
