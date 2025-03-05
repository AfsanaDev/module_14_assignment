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
                  
                  Center(
                    child: Container(
                      height: 100,
                      color: Colors.amber.shade200,
                      child: Image.network(product.img.toString(),fit: BoxFit.cover,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start ,
                      //mainAxisSize: MainAxisSize.min,
                      
                      children: [
                        
                        Text(product.productName.toString(),
                        style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.w600,                   
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                          Text('Price: ${product.productName.toString()}',
                                                style: TextStyle(fontSize: 12,
                                                fontWeight: FontWeight.w500,  
                                                color: Colors.black54                    
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                ),
                                                 Text('Quantity: ${product.qty.toString()}',
                                                style: TextStyle(fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54                   
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                ) , 
                        
                         Text('Total Price: ${product.totalPrice.toString()}',
                        style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w500,  
                        color: Colors.black54                    
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                            
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            IconButton(onPressed: ()=>onEdit(), icon: Icon(Icons.edit)),
                            IconButton(onPressed: ()=>onDelete(), icon: Icon(Icons.delete, color: Colors.red,))
                          ],),
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}