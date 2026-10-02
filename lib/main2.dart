import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

// Profile page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container, Padding, Row & Column'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child:Container(
        padding: const EdgeInsets.all(20),
        width: 350,
        decoration: BoxDecoration( 
        color: const Color.fromARGB(255, 163, 243, 33),
        borderRadius:BorderRadius.circular(15)),

         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            Center(child: Icon(Icons.person, size: 50,color: Colors.black,)),
            const SizedBox(height: 5,),
            Center(child: Text("MY Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 5,),
            const Center(child: Text("Name: Janchristian Pelayre")),
            const SizedBox(height: 5,),
            const Center(child:Text("Age: 67")),
            const SizedBox(height: 5,),
            const Center(child:Text("Location: Bojol")),
            const SizedBox(height: 5,),
          ],
         ),
        )
        
  
       ),
    );
  }
}