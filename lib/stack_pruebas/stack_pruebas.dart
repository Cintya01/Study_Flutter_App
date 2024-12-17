import 'package:flutter/material.dart';

class StackPageTest extends StatelessWidget {
  const StackPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double heightHeaderPlayer = size.height * 0.15;
    double heightAlbumPlayer = size.height * 0.65;
    double heightContinuePlaying = size.height * 0.20;

    return Scaffold(
      body: Column(
        children: [
          HeaderPlayer(
            height: heightHeaderPlayer,
          ),
          AlbumPlayer(
            height: heightAlbumPlayer,
          ),
          ContinuePlaying(
            height: heightContinuePlaying,
          ),
        ],
      ),
    );
  }
}

class HeaderPlayer extends StatelessWidget {
  final double height;
  const HeaderPlayer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.grey,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.person_2),
            onPressed: () {},
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('User Name'),
              Text('User Email'),
            ],
          ),
          Row(
            children: [
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ]),
        ],
      ),
    );
  }
}

class AlbumPlayer extends StatelessWidget {
  final double height;
  const AlbumPlayer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.black,
      child: Stack(children: [
        //filtros - 70
        Container(
          width: double.infinity,
          height: 70,
          color: Colors.red,
        ),

        //carrusel img
        Positioned(
          top: 70,
          child: Container(
            width: size.width,
            height: height - 120,
            //color: Colors.white,
            child: carruselImg(),
          ),
        ),
        //botones - 40
        Positioned(
            bottom: 10,
            left: size.width * .25,
            right: size.width * .25,
            child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    points(false),
                    points(false),
                    points(false),
                    points(true),
                    points(false),
                    points(false),
                    points(false),
                  ],
                ))),
      ]),
    );
  }

  Widget points(bool isCircle) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isCircle ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget carruselImg() {
    return Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 8,
        ),
        child: Stack(
          children: [
            //Imagenes 1 left
            Positioned(
              top: 30,
              bottom: 0,
              left: -60,
              child: Transform.rotate(
                angle: -0.1,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            //Imagenes 2 right
            Positioned(
              top: 30,
              bottom: 0,
              right: -60,
              child: Transform.rotate(
                angle: 0.1,
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            //Imagenes 3 center
            Positioned(
              top: 0,
              bottom: 30,
              left: 65,
              right: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ));
  }
}

class ContinuePlaying extends StatelessWidget {
  final double height;
  const ContinuePlaying({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.green,
    );
  }
}


//column
//row
//stack
//row again album player