import 'package:flutter/material.dart';

class GaleriaImagenesPage extends StatelessWidget {
  const GaleriaImagenesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Galería de Imágenes"),
        ),
        body: Center(
          child: Image.network(
            "https://placecats.com/300/200",
            // "https://place.dog/300/200",
            width: 200,
            height: 200,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
        ));
  }
}


//Mini App de Imagenes
// Grid Mosaico de Imagenes (n)
// Poder ver imagen en pantalla completa al hacer click
// Poder Modificar la cantidad de elementos en la grilla
// Boton para agregar nueva imagen
