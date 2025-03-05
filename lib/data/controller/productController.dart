
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:module_14_assignment/data/models/productModel.dart';
import 'package:module_14_assignment/data/models/utils/urls.dart';

class ProductController {

  late List<Data> products = [];

  Future<void> fetchProducts() async{

    final response =  await http.get(Uri.parse(Urls.readProduct));

    //print(responnse.body);

    try{

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        productModel productList = productModel.fromJson(data);
        products = productList.data ?? [];
        print(productList);
    }
    }catch(e){
      print('error $e');
    }

  }

  //Create product

  Future<void> createProducts(String name,
  int qty, int price, 
  int totalPrice,
  String img,
  ) async{

    final response =  await http.post(Uri.parse(Urls.createProduct),
    headers: {
      'Content-Type': 'application/json'
    },
    body: jsonEncode({
        "ProductName": name,
        "ProductCode": DateTime.now().millisecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": price,
        "TotalPrice": totalPrice
    })
    );

    //print(responnse.body);

    try{

      if(response.statusCode == 200){
        fetchProducts();
    }
    }catch(e){
      print('error $e');
    }

  }

  //Updatete product

  Future<void> updateProducts(String id,String name,
  int qty, int price, 
  int totalPrice,
  String img,
  ) async{

    final response =  await http.post(Uri.parse(Urls.updateProduct(id)),
    headers: {
      'Content-Type': 'application/json'
    },
    body: jsonEncode({
        "ProductName": name,
        "ProductCode": DateTime.now().millisecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": price,
        "TotalPrice": totalPrice
    })
    );

    //print(responnse.body);

    try{

      if(response.statusCode == 201){
        fetchProducts();
    }
    }catch(e){
      print('error $e');
    }

  }

  //Delete product
   Future<bool> deleteProducts(String id) async{

    final response =  await http.get(Uri.parse(Urls.deleteProduct(id)));

    //print(responnse.body);


      if(response.statusCode == 200){
        //final data = jsonDecode(responnse.body);
        return true;
    }else{
      return false;
    }
    

  }
}