import 'package:flutter/material.dart';
//import 'package:insta_image_viewer/insta_image_viewer.dart';

class GaleriaImagenesPage extends StatefulWidget {
  const GaleriaImagenesPage({super.key});

  @override
  State<GaleriaImagenesPage> createState() => _GaleriaImagenesPageState();
}

class _GaleriaImagenesPageState extends State<GaleriaImagenesPage> {
  final List<String> imagesList = [
    "https://place.dog/300/200",
  ];
  int gridCount = 2;

  addImage() {
    int lastIndex = int.parse(imagesList.last.split("/")[4]);
    setState(() {
      imagesList.add("https://placecats.com/300/${lastIndex + 1}");
    });
  }

  dialogImg(String url, int i) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imagesList[i]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xFF275846),
        body: Column(
          children: [
            const SafeArea(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: headerSection(context),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(width: size.width, child: textSection()),
            ),
            const SizedBox(
              height: 36,
            ),
            bodySection(),
          ],
        ));
  }

  Widget headerSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              width: 32,
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 16,
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            addImage();
          },
          child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.add,
                ),
              )),
        ),
      ],
    );
  }

  Widget textSection() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Image Gallery",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          Text("Created 2 days ago",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300)),
        ]);
  }

  Widget bodySection() {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Recently Added",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gridCount = 2;
                            });
                          },
                          child: const Icon(Icons.grid_view),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gridCount = 3;
                            });
                          },
                          child: const Icon(Icons.grid_on_sharp),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (BuildContext context, int i) {
                      return GestureDetector(
                        onTap: () {
                          dialogImg(imagesList[i], i);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: NetworkImage(imagesList[i]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridCount,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: imagesList.length,
                  ),
                )
              ],
            )));
  }
}




//Color Verde: 275846


//Mini App de Imagenes
// Grid Mosaico de Imagenes (n) ready
// Poder ver imagen en pantalla completa al hacer click ready
// Poder Modificar la cantidad de elementos en la grilla
// Boton para agregar nueva imagen


 // appBar: AppBar(
        //   title: const Text("Galería de Imágenes"),
        // ),
        // body: const Column(
        //   children: [
        //     GridView.builder(
        //      itemCount: imagesList.length,
        //      itemBuilder: (BuildContext context, int index) {
                    //   return InstaImageViewer(
                    //       child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(16.0),
                    //     child: Image.network(
                    //       imagesList[index],
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ));
                    // },
        //      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //          crossAxisCount: 2,
        //       crossAxisSpacing: 4.0,
        //        mainAxisSpacing: 4.0,
        //         childAspectRatio: 1.0,
        //        ),
        //        padding: const EdgeInsets.all(16.0),
        //      ),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {}, child: const Text("Agregar"))