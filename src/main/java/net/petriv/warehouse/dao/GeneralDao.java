package net.petriv.warehouse.dao;

import java.sql.SQLException;
import java.util.List;

public interface GeneralDao<T> {

    void save(T newEntity);

    T getById(long id);

    List<T> getAll();

    void delete(long id);

    void update (T entity);
}
