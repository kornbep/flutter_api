import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Activity - Set E",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Activity - Set E"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Network Image
            const Text(
              "Network Image",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Center(
              child: Image.network(
                "https://hips.hearstapps.com/hmg-prod/images/msm2-reveal-attack-4k-legal-65284680c18ba.jpg?crop=0.490xw:0.872xh;0.115xw,0&resize=1200:*",
                width: 220,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Spider-Man is a superhero known for his spider-like abilities,"
              " including climbing walls, jumping high, and using web-shooters."
              " He uses his powers to protect people and fight criminals."
              " His famous motto teaches that with great power comes great responsibility.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // Five Icons
            const Text(
              "Icons",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Music
                Column(
                  children: [
                    Icon(Icons.home, size: 45, color: Colors.deepOrangeAccent),
                    SizedBox(height: 5),
                    Text("Home"),
                  ],
                ),

                // Search
                Column(
                  children: [
                    Icon(Icons.search, size: 45, color: Colors.blue),
                    SizedBox(height: 5),
                    Text("Search"),
                  ],
                ),

                // Favorite
                Column(
                  children: [
                    Icon(Icons.star, size: 45, color: Colors.yellow),
                    SizedBox(height: 5),
                    Text("Star"),
                  ],
                ),

                // School
                Column(
                  children: [
                    Icon(Icons.sports_basketball, size: 45, color: Colors.redAccent),
                    SizedBox(height: 5),
                    Text("Basketball"),
                  ],
                ),

                // Home
                Column(
                  children: [
                    Icon(Icons.book, size: 45, color: Colors.black),
                    SizedBox(height: 5),
                    Text("Book"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Local Image
            const Text(
              "Local Image",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Center(child: Image.asset("assets/tubol.jpeg", width: 220)),
          ],
        ),
      ),
    );
  }
}