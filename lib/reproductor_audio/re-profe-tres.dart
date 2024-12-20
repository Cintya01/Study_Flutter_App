import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer player;
  Duration? _totalDuration = const Duration(seconds: 0);
  Duration _currentPosition = Duration.zero;
  double lyricsHeight = 160;
  bool isExpandedLyrics = false;

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

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "$minutes:${seconds.toString().padLeft(2, "0")}";
  }

  double _calculatePercentage() {
    if (_totalDuration == null || _totalDuration!.inMilliseconds == 0) {
      return 0.0;
    }
    return ((_currentPosition.inMilliseconds / _totalDuration!.inMilliseconds) *
            100) /
        100;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * .45;

    double appBarPosition = size.height * .07;
    double imgPosition = size.height * .15;
    double controlsPosition = size.height * .22;

    Duration animationDuration = const Duration(milliseconds: 200);

    return Scaffold(
      backgroundColor: const Color(0xFF13122B),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: appBarPosition,
              left: 0,
              right: 0,
              child: Row(
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
            ),
            Positioned(
              left: 0,
              right: 0,
              top: imgPosition,
              child: Container(
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
            ),
            // songInfo(),
            Positioned(
              left: 0,
              right: 0,
              bottom: controlsPosition,
              child: audioControls(size),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.easeIn,
                height: lyricsHeight,
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
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isExpandedLyrics = !isExpandedLyrics;
                              lyricsHeight = isExpandedLyrics ? 650 : 160;
                            });
                          },
                          icon: Icon(
                            isExpandedLyrics
                                ? Icons.close_fullscreen_outlined
                                : Icons.open_in_full_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
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
      ),
    );
  }

  songInfo() {
    return Container(
      height: 40,
    );
  }

  audioControls(Size size) {
    double percentage = size.width * _calculatePercentage();

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
                  _formatDuration(_currentPosition),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _formatDuration(_totalDuration!),
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 28,
            ),
            const Icon(
              Icons.skip_previous_rounded,
              color: Colors.white,
              size: 28,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF643CEB),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  if (player.playing) {
                    player.pause();
                  } else {
                    player.play();
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
