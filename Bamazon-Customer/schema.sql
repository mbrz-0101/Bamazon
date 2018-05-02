DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(100) NOT NULL,
  price INT(50) NOT NULL,
  stock_quantity INT(50) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("echo dot", "electronics", 50, 857);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("fujimax film", "photo", 21, 129);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("a higher loyalty", "books", 14, 689);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("sneakers", "shoes/apparel", 28, 490);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("baby's swim hat", "apparel", 8, 59);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("swerve confectioners sugar", "food", 32, 83);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("woolrich blanket", "home decor", 48, 12);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("beef jerky", "food", 16, 246);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("granola bars", "food", 8, 758);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("black ink cartridges", "office supplies", 5, 62);

SELECT * FROM products;