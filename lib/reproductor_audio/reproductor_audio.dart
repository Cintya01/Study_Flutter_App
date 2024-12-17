//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  // String audioUrl = "mp3/song-1.mp3";

  // late AudioPlayer _audioPlayer = AudioPlayer();

  // @override
  // void initState() {
  //   super.initState();
  //   _audioPlayer = AudioPlayer();

  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await _audioPlayer.setSource(AssetSource(audioUrl));
  //     await _audioPlayer.resume();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * 0.45;

    return Scaffold(
        backgroundColor: const Color(0xFF13122B),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                  const Text("Recently Played",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: size.width,
                height: imgHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                        image: AssetImage("assets/img/tswift.jpg"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Love Story",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("Taylor Swift",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  audioControls(),
                  lyricsBox(),
                ],
              ),
            ],
          ),
        ));
  }

  audioControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Slider(
            value: 0.5,
            onChanged: (double value) {},
            activeColor: const Color(0xFF643CEB),
            inactiveColor: Colors.white,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("1:20", style: TextStyle(color: Colors.white, fontSize: 12)),
            Text("3:46", style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shuffle_rounded,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_previous_sharp),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_filled_sharp),
              iconSize: 40,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next_sharp),
              color: Colors.white,
            ),
            const Icon(
              Icons.repeat,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  lyricsBox() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
      child: Container(
        color: const Color(0xFF302F42),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lyrics",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.open_in_new_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.open_in_full_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    "We were both young when I first saw you",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "I close my eyes and the flashback starts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "I'm standing there on a balcony in summer air",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




//Azul/fondo: 131226B
//Morado/Lila: 643CEB
//gris lyric: 302F42



