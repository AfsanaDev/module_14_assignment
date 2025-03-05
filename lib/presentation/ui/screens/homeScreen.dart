
import 'package:flutter/material.dart';
import 'package:module_14_assignment/data/controller/productController.dart';
import 'package:module_14_assignment/presentation/ui/widgets/customCardDesign.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  final ProductController productController = ProductController();
  void productDialog({String? id,
  String? name,
  int ? qty,
  int? unitPrice,
  int? totalPrice,
  String? img}
  ){
    TextEditingController productNameController = TextEditingController();
    TextEditingController productImageController = TextEditingController();
    TextEditingController productQtyController = TextEditingController();
    TextEditingController productUnitPriceController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();

    productNameController.text = name ?? '';
    productImageController.text = img ?? '';
    productQtyController.text = qty!= null?  qty.toString() : '0';
    productUnitPriceController.text = unitPrice  != null ?  unitPrice.toString() : '0';
    productTotalPriceController.text = totalPrice !=null ? totalPrice.toString() : '0';
    
    showDialog(context: context,
     builder: (context){
      return AlertDialog(
        title: Text(id == null ? 'Add Product' : 'Update product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
              
              ),
              
            ),
            TextField(
              controller: productImageController,
              decoration: InputDecoration(
                labelText: 'Product image'
              ),
            ),
            TextField(
              controller: productQtyController,
              decoration: InputDecoration(
                labelText: 'Product Quantity'
              ),
            ),
            TextField(
              controller: productUnitPriceController,
              decoration: InputDecoration(
                labelText: 'Product Unit Price'
              ),
            ),
            TextField(
              controller: productTotalPriceController,
              decoration: InputDecoration(
                labelText: 'Product Total Price'
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)
                ),  
                onPressed: (){
                    
                      if(id== null ){
                    productController.createProducts(
                    productNameController.text,
                    int.parse(productQtyController.text),
                    int.parse(productUnitPriceController.text), 
                    int.parse(productTotalPriceController.text), 
                    productImageController.text);
                      }else{
                    productController.updateProducts(
                    id,  
                    productNameController.text,
                    int.parse(productQtyController.text),
                    int.parse(productUnitPriceController.text), 
                    int.parse(productTotalPriceController.text), 
                    productImageController.text);
                      }
                    
                     fetchData();
                     setState(() {
                     });
                   
                    Navigator.pop(context);
                }, child: Text(id == null ? 'Add Product' : 'Update product', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500
                ),)),
              ],
            ),
          ],
        ),
      );
     });
  }
   Future<void> fetchData() async{
    await productController.fetchProducts();
    setState(() {
      
    });
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Products',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white
          ),),
          centerTitle: true,
        ),

        body: GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           crossAxisSpacing: 0,
           mainAxisSpacing: 1,
           childAspectRatio: 0.8
            ),
          itemCount: productController.products.length,
          itemBuilder: (context, index){
            var product = productController.products[index];
          return CustomCardDesign(
            product: product,
             onEdit: ()=>productDialog(id: product.sId, 
             name: product.productName, 
             qty: product.qty, 
             unitPrice: product.unitPrice,
             totalPrice: product.totalPrice,
             img: product.img),
              onDelete: (){
              productController.deleteProducts(product.sId.toString()).then((value) {
                if (value) {
                  setState(() {
                    fetchData();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Product deleted"),
                      duration: Duration(seconds: 2),

                    ),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Something wrong try again"),
                      duration: Duration(seconds: 2),

                    ),
                  );
                }
              });
            },
          );
        },),

        floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.amber,
        onPressed: ()=>productDialog(),
        child: Icon(Icons.add, color: Colors.white,),),
      ),
    );
  }
}
