import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: Scaffold(
        appBar: AppBar(title: const Text('titulo principal')),

        body: Center(
          child: Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            // contenido del contenedor
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //hijos del contenedor
              children: [
                //hijo 1
                Column(
                  //centrar el contenido de la columna
                  mainAxisAlignment: MainAxisAlignment.center,
                  //hijos del contenedor
                  children: [
                    //hijo 1
                    Icon(Icons.person, color: Colors.white, size: 50),
                    //hijo 2
                    Text(
                      'Flutter',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                //hijos 2 row
                Column(
                  //centrar el contenido de la columna
                  mainAxisAlignment: MainAxisAlignment.center,
                  //hijos del contenedor
                  children: [
                    //hijo 1
                    Icon(Icons.phone, color: Colors.white, size: 50),
                    //hijo 2
                    Text(
                      'Flutter',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
