CREATE DATABASE warehouse;

CREATE TABLE manufacturer (
  id   BIGINT      NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL ,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE product (
  id     BIGINT            NOT NULL AUTO_INCREMENT,
  manufacturer_id BIGINT   NOT NULL ,
  name   VARCHAR(30)       NOT NULL,
  price  BIGINT            NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT product_manufacturer FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturer (id)
      ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;



