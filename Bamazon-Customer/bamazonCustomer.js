const mysql = require("mysql");
const inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  user: "root",
  password: "q5571Y3416",
  database: "bamazon"
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("Connection open on PORT 3306");

  runApp();

});

function runApp() {
  var query = "SELECT * FROM products";
  connection.query(query, function (err, res) {
    res.forEach(element => {
      console.log("=========================");
      console.log(`id:       ${element.id}`);
      console.log(`Product:  ${element.product_name}`);
      console.log(`Price:    $${element.price}`);
    });
    askForPurchase();
  });
}

function askForPurchase() {
  console.log("=============================");
  console.log();
  inquirer
    .prompt([
      {
        name: "id_number",
        type: "input",
        message: "What is the id of the item you'd like to purchase ",
      },
      {
        name: "quantity",
        type: "input",
        message: "How many of these would you like to purchase ",
      }
    ])
    .then(function (answer) {
      var query = "SELECT * FROM products WHERE id=" + answer.id_number;
      connection.query(query, function (err, res) {
        if (answer.quantity < res[0].stock_quantity) {
          var query2 = "UPDATE products SET stock_quantity=" + (res[0].stock_quantity - answer.quantity) + " WHERE id=" + answer.id_number;
          connection.query(query2, function (err, res) {
            if (err) throw err;
          });
          console.log("Thank you. The total cost of your order is " + res[0].price * answer.quantity);
        } else {
          console.log("Insufficient quantity of item to fill your order");
        }
        connection.end();
      });
    });
}
