import 'dart:io';

class Product {
   String? name;
   double? price;
   Product({required this.name,required this.price});

   @override
   String toString(){
     return 'Product(name: $name,price: $price)';
   }
}


class ShoppingCart
{
  List<Product> ProductList = [];
  double total = 0.0;
  void addProduct(Product product)
  {
    ProductList.add(product);
    print("Shopping List:");
    for (var object in ProductList){
      print(object);
    }

  }
  double calc_total(Product product)
  {
    total += product.price!;
    print("total: $total");
    return total;
  }
}


void checkCustomerAge(int age)
{
  if (age <= 0){
    throw Exception("Age Error!");
  }
}

void main()
{
  ShoppingCart shoppingCart1 = ShoppingCart();
  int age,cus_num;
  double sale,after_sale,totally;

  print("Age: ");
  age = int.parse(stdin.readLineSync()!);
  checkCustomerAge(age);
  print("Customer Number: ");
  cus_num = int.parse(stdin.readLineSync()!);

  if (age < 18){
    sale = 0.9;
  }
  else if(age >= 18 && age <= 60)
  {
    sale = 0.95;
  }
  else {
    sale = 0.85;
  }

  String str;
  outerloop:
  while (1 == 1){
    print("1-Add Product:\nq-Exit:");
    str = stdin.readLineSync()!;
    switch (str){
      case '1':
        print("Product Name: ");
        String name = stdin.readLineSync()!;
        print("Product Price: ");
        double price = double.parse(stdin.readLineSync()!);
        Product product1 = Product(name: name, price: price);
        shoppingCart1.addProduct(product1);
        totally = shoppingCart1.calc_total(product1);
        totally *= sale;
        print("after sale: $totally");
        break;
      case 'q':
        break outerloop;
    }
  }
}