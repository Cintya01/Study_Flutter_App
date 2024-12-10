import 'dart:io';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final titulo = "Titulito del Widget";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isAndroid = Platform.isAndroid;

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(titulo),
          centerTitle: true,
          leading: const Row(children: [
            Icon(Icons.menu),
          ]),
          actions: const [FlutterLogo()],
        ),
        // body: const Column(
        //   children: [
        //     Text("Hola Mundo"),
        //     Text(
        //       "Hola Mundo",
        //       style: TextStyle(
        //         fontSize: 30,
        //         color: Colors.red,
        //       ),
        //     ),
        //     Text(
        //       "Hola Mundo",
        //       style: TextStyle(
        //         fontSize: 30,
        //         fontFamily: "Arial",
        //         color: Color(0xFF590DE5),
        //       ),
        //     ),
        //     Text("Hola Mundo"),
        //     Text("Hola Mundo"),
        //   ],
        // ),
        // body: SizedBox(
        //   width: size.width,
        //   height: size.height,
        //   child: Stack(children: [
        //     Positioned(
        //       left: 16,
        //       bottom: isAndroid ? 16 : 50,
        //       child: myButtonFloating(),
        //     ),
        //   ]),
        // )
        body: const MyWidgets(),
      ),
    );
  }

//FloatingActionButtonPersonalizado
  Widget myButtonFloating() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}

class MyWidgets extends StatelessWidget {
  const MyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Mis widgets basicos"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated button")),
            const SizedBox(width: 8),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined button")),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated button")),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined button")),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        Container(
          color: Colors.pink[100],
          width: 200,
          height: 180,
          child: Image.network(
            "https://storage.googleapis.com/cms-storage-bucket/d83012c34a8f88a64e2b.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.pink[300],
          width: 200,
          height: 180,
          child: Image.asset(
            "assets/img/FlutterGlobo.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Column(
            children: [
              InkWell(
                onTap: () => print("Click en el boton"),
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => print("Click en el boton"),
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Elevated button")),
            const SizedBox(width: 8),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined button")),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
