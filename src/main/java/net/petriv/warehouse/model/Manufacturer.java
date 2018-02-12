package net.petriv.warehouse.model;

import java.io.Serializable;
import java.util.Objects;
import java.util.Set;
import javax.persistence.*;

@Entity
@Table(name = "manufacturer")
public class Manufacturer implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "manufacturer", fetch = FetchType.EAGER)
    Set<Product> products;

    public Manufacturer() {
    }

    public Manufacturer(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Manufacturer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", products=" + products  +
                '}' + "\n";
    }
}
