import net.petriv.warehouse.dao.ManufacturerDao;
import net.petriv.warehouse.dao.ProductDao;
import net.petriv.warehouse.model.Manufacturer;
import net.petriv.warehouse.model.Product;

import java.math.BigDecimal;

public class Test {

    public static void main(String[] args) {
        ManufacturerDao manufacturerDao = new ManufacturerDao();
        ProductDao productDao = new ProductDao();

        productDao.delete(4);








    }
}
