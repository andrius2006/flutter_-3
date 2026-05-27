import 'package:flutter/material.dart';


class Trabajo extends StatelessWidget {
  const Trabajo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tarjeta de presentación"),
        ),
        body: Center(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 183, 0, 0),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2), // Agregar borde
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Icon(
                  Icons.person,
                  
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 100,
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Andres Gonzalez Chaparro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: const [
                        Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 15,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "chaparrofelipe60@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: const [
                        Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 15,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "3202894485",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 15,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Bogotá",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}