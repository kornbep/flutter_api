import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> Fruits = [
      'Apple',
      'Orange',
      'Jiliane',
      'Aguanza',
      'Pineapple',
      'Banana',
      'Mango',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruits List'),
        ),

        body: ListView.builder(
          itemCount: Fruits.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Fruits[index],
                      style: const TextStyle(fontSize: 18),
                    ),

                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        print('${Fruits[index]} added to cart');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}