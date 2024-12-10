import 'dart:developer';

import 'package:flutter/material.dart';

class Estados extends StatefulWidget {
  const Estados({super.key});

  @override
  State<Estados> createState() => _EstadosState();
}

class _EstadosState extends State<Estados> {
  int contador = 0;

  @override
  void initState() {
    // TODO: implement initState
    log("initState()");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(children: [
                Text("Contador: $contador", style: TextStyle()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contador++;
                    });
                  },
                  child: const Text("Sumar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contador--;
                    });
                  },
                  child: const Text("Restar"),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
