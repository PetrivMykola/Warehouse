package net.petriv.warehouse.dao;

import net.petriv.warehouse.model.Manufacturer;
import java.util.List;

public class ManufacturerDao extends AbstractDao<Manufacturer> implements GeneralDao<Manufacturer> {

    public ManufacturerDao() {
        super.setClazz(Manufacturer.class);
    }

    @Override
    public void save(Manufacturer manufacturer) {
        saveOne(manufacturer);
    }

    @Override
    public Manufacturer getById(long id) {
        return findOne(id);
    }

    @Override
    public List<Manufacturer> getAll() {
        return findAll();
    }

    @Override
    public void delete(long id) {
        deleteOne(id);
    }

    @Override
    public void update(Manufacturer manufacturer) {
        updateOne(manufacturer);
    }
}
