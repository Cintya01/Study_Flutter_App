import 'package:flutter/material.dart';
import 'package:mi_primera_app/entrada_de_datos/in_datos.dart';
import 'package:mi_primera_app/galeria_imagenes/galeria_imagenes.dart';
import 'package:mi_primera_app/gestor-habitos/home_hab.dart';

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
                        builder: (context) =>  GaleriaImagenesPage()));
              },
              child: const Text("Galeria de Imágenes"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Reproductor de audio"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("To Do - Provider"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("To Do - Bloc"),
            ),
          ],
        ),
      ),
    );
  }
}
