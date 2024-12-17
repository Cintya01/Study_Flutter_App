import 'package:flutter/material.dart';
import 'package:mi_primera_app/bloc/todo_bloc_ejercicio.dart';
import 'package:mi_primera_app/entrada_de_datos/in_datos.dart';
import 'package:mi_primera_app/galeria_imagenes/galeria_imagenes.dart';
import 'package:mi_primera_app/gestor-habitos/home_hab.dart';
import 'package:mi_primera_app/reproductor_audio/re-profe-dos.dart';
import 'package:mi_primera_app/reproductor_audio/reproductor_audio.dart';
import 'package:mi_primera_app/reproductor_audio/reproductor_profe.dart';
import 'package:mi_primera_app/stack_pruebas/stack_pruebas.dart';
import 'package:mi_primera_app/todo_block/todo_blocClass.dart';
import 'package:mi_primera_app/todo_provider/todo_provider.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HabitosHomePage()));
              },
              child: const Text("Gestor de hábitos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InDatos()));
              },
              child: const Text("Widget de entrada de datos"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GaleriaImagenesPage()));
              },
              child: const Text("Galeria de Imágenes"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AudioProfe()));
              },
              child: const Text("Reproductor de Audio"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StackPageTest()));
              },
              child: const Text("Stack Test Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoProvider()));
              },
              child: const Text("TodoProvider"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoBlocPage()));
              },
              child: const Text("To Do - Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
