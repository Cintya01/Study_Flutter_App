import 'package:flutter/material.dart';

class AdoptAppBarWidget extends StatelessWidget {
  const AdoptAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Avatar
                CircleAvatar(
                  backgroundColor: Color(0xffff5a06),
                  radius: 30,
                ),
                SizedBox(width: 16),
                //Titulo
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ora Brock",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Color(0xff42301c),
                      ),
                    ),
                    Text(
                      "Volunteer in pet shelter",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Color(0xff42301c),
                      ),
                    ),
                    Text(
                      "2 adoptions",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color(0xffb5bdb0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Icono
            Icon(Icons.menu, color: Color(0xffff5a06)),
          ],
        ));
  }
}



// fondo: ddece3
//verde oscuro:8fd2c1
//orange: ff5a06
//cafe letra: 42301c
//subtitulo: b5bdb0