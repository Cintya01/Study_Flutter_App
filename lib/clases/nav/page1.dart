import 'package:flutter/material.dart';
import "package:mi_primera_app/clases/nav/page2.dart";

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page 1'),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Page2(
                  product: 'Monitor',
                ),
              ),
            );
          },
          child: const Text('Go to Page 2')),
    );
  }
}
