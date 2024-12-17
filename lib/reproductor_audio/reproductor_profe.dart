import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProfe extends StatefulWidget {
  const AudioPlayerProfe({super.key});

  @override
  State<AudioPlayerProfe> createState() => _AudioPlayerProfeState();
}

class _AudioPlayerProfeState extends State<AudioPlayerProfe> {
  late AudioPlayer player;
  Duration? _totalDuration = const Duration(seconds: 0);
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset('assets/mp3/song-1.mp3');

    player.durationStream.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    player.positionStream.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  String _getDurationFormat(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  double _calculatePercentage() {
    if (_totalDuration == null) {
      return 0.0;
    }
    return _currentPosition.inMilliseconds / _totalDuration!.inMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * .45;

    double appBarPosition = size.height * .1;
    double imgPosition = size.height * .1;
    double songInfoPosition = size.height * .1;
    double audioControlsPosition = size.height * .1;
    double lyricsPosition = size.height * .1;

    return Scaffold(
      backgroundColor: const Color(0xFF13122B),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Stack(
            
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Recently Played",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    height: imgHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage("assets/img/tswift.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  songInfo(),
                  audioControls(size),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF302F42),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Lyrics",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.open_in_new_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.open_in_full_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Midnight",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          const Text(
                            "You come and pick me up, no headlights",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Long drive",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Text(
                            "You come and pick me up, no headlights",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),
    );
  }

  songInfo() {
    return Row(
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
    );
  }

  audioControls(Size size) {
    double percentage = size.width * (_calculatePercentage() * 100) / 100;

    timeSlider() {
      return SizedBox(
        width: size.width,
        height: 10,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              width: size.width,
              height: 4,
              color: Colors.white,
            ),
            Container(
              width: percentage,
              height: 4,
              color: const Color(0xFF643CEB),
            ),
            Positioned(
              left: percentage,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFF643CEB),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Column(
          children: [
            timeSlider(),
            //Minutos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getDurationFormat(_currentPosition),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _getDurationFormat(_totalDuration!),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        //Controles
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 28,
            ),
            IconButton(
              onPressed: () {
                player.stop();
              },
              icon: const Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF643CEB),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () async {
                  if (player.playing) {
                    await player.pause();
                  } else {
                    await player.play();
                  }
                },
                icon: Icon(
                  player.playing ? Icons.pause : Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 28,
            ),
            const Icon(
              Icons.repeat,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ],
    );
  }
}

// Azul (fondo)   : 13122B
// Morado / lila  : 643CEB
// gris (lyric)   : 302F42





//just_audio: ^0.9.42



