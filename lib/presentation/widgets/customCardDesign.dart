import 'package:flutter/material.dart';
import 'package:module_14_assignment/data/models/productModel.dart';

class CustomCardDesign extends StatelessWidget {
  final Data product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomCardDesign({super.key, required this.product, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10),
               boxShadow: [
                BoxShadow(
                  color: Colors.amber.shade400,
                  blurRadius: 5,
                  offset: Offset(0, 3)
                )
               ] 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.amber.shade200,
                      child: Image.network(product.img.toString(),fit: BoxFit.cover,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      mainAxisSize: MainAxisSize.min,
                      
                      children: [
                        
                        Text(product.productName.toString(),
                        style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,                   
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                            
                        Text('Price: ${product.productName.toString()}',
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,  
                        color: Colors.black54                    
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                         Text('Quantity: ${product.qty.toString()}',
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54                   
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                         Text('Total Price: ${product.totalPrice.toString()}',
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,  
                        color: Colors.black54                    
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                            
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,))
                          ],),
                        )
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}