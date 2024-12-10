import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class GaleriaImagenesPage extends StatelessWidget {
  GaleriaImagenesPage({super.key});

  final List<String> imagesList = [
    "https://place.dog/300/200",
    "https://place.dog/300/206",
    "https://place.dog/300/205",
    "https://place.dog/300/204",
    "https://place.dog/300/201",
    "https://place.dog/300/203",
    "https://place.dog/300/202",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Galería de Imágenes"),
        ),
        body: GridView.builder(
          itemCount: imagesList.length,
          itemBuilder: (BuildContext context, int index) {
            return InstaImageViewer(
              child: Image.network(
                imagesList[index],
                fit: BoxFit.cover,
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: 1.0,
            //mainAxisExtent: 300,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        // Center(
        //   child: Image.network(
        //     "https://placecats.com/300/200",
        //     // "https://place.dog/300/200",
        //     width: 200,
        //     height: 200,
        //   ),
        // ),

        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Text("Agregar")));
  }
}


//Mini App de Imagenes
// Grid Mosaico de Imagenes (n) ready
// Poder ver imagen en pantalla completa al hacer click ready
// Poder Modificar la cantidad de elementos en la grilla
// Boton para agregar nueva imagen
