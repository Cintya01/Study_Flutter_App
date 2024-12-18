import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdoptFilterWidget extends StatelessWidget {
  const AdoptFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double _cardWidth = size.width * 0.2;

    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildCardWidget(_cardWidth,
              icon: const Icon(Icons.pets, color: Colors.white), title: "Dog"),
          buildCardWidget(_cardWidth,
              icon: const Icon(
                Icons.face,
                color: Colors.white,
              ),
              title: "Cat"),
          buildCardWidget(_cardWidth,
              icon: const Icon(Icons.flutter_dash, color: Colors.white),
              title: "Reptile"),
          buildCardWidget(_cardWidth,
              icon: const Icon(Icons.snapchat, color: Colors.white),
              title: "Bird"),
        ],
      ),
    );
  }
}

Widget buildCardWidget(
  double width, {
  required Icon icon,
  required String title,
}) {
  return Container(
      width: width,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xff8fd2c1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ));
}



// fondo: ddece3
//verde oscuro:8fd2c1
//orange: ff5a06
//cafe letra: 42301c
//subtitulo: b5bdb0