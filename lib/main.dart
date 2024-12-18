import 'package:flutter/material.dart';
// import 'package:mi_primera_app/clases/estados.dart';
// import 'package:mi_primera_app/clases/my_widgets.dart';
// import 'package:mi_primera_app/clases/nav/page1.dart';
import 'package:mi_primera_app/menu.dart';
// import 'package:mi_primera_app/todo_provider/todo_provider.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(home: Menu()));
  // runApp(ChangeNotifierProvider(
  //   create: (_) => TaskProvider(),
  //   child: const MaterialApp(
  //     home: Menu(),
  //   ),
  // ));
}
