import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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

        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.amber, width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListTile(
                leading: Image.network('https://imgs.search.brave.com/CAVS6PSSk_g7pS7VUw5Z4Eq5eOJXP2I8yu8VW8_SwLA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/NzFUaHljT0tuU0wu/anBn'),
                title: Text('Product name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Text('Product quantity'),
                    Text('Product unit price'),
                    Text('Product total price'),
                  ],
                ),
                
              ),
            ),
          );
        }),

        floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: Colors.amber,
        onPressed: (){},
        child: Icon(Icons.add, color: Colors.white,),),
      ),
    );
  }
}