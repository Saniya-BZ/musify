
import 'package:flutter/material.dart';
import 'package:musify/models/playlist.dart';
import 'package:provider/provider.dart';

import '../components/neu_box.dart';


class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  String formatTime(Duration duration){
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString();
    String formattedTime= "${duration.inMinutes}: $twoDigitSeconds}";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
        builder:(context, value , child) {

          final playlist = value.playlist;
          final currentSong = playlist[value.currentSongIndex ?? 0];
          return Scaffold(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .background,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back)),
                        const Text("P L A Y I S T"),
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.menu))
                      ],
                    ),
                    NeuBox(child:
                    Column(
                      children: [
                        ClipRect(
                          child: Image.asset(currentSong.albumArtImagePath),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(currentSong.songName, style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20,),),
                                  Text(currentSong.artistName),
                                ],
                              ),
                              const Icon(Icons.favorite,
                                color: Colors.red,)
                            ],
                          ),
                        )
                      ],
                    ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatTime(value.currentDuration)),
                            const Icon(Icons.shuffle),
                            const Icon(Icons.repeat),
                            Text(formatTime(value.totalDuration))
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 0)
                          ),
                          child: Slider(min: 0,
                            max: value.totalDuration.inSeconds.toDouble(),
                            value:value.currentDuration.inSeconds.toDouble() ,
                            activeColor: Colors.green,
                            onChanged: (double double) {

                            },
                            onChangeEnd: (double double){
                              value.seek(Duration(seconds:double.toInt() ));
                            },),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                              onTap:value.playPreviousSong,child:
                          const NeuBox(
                              child:
                              Icon(Icons.skip_previous))),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          flex: 2,
                          child: GestureDetector( onTap:value.pauseOrResume,child:
                          NeuBox(
                              child:
                              Icon(value.isPlaying ? Icons.pause : Icons.play_arrow)),
                          ),
                        ),

                        const SizedBox(width: 20),

                        Expanded(
                          child: GestureDetector(
                              onTap:value.playNextSong,child:
                          const NeuBox(
                              child:
                              Icon(Icons.skip_next))),
                        ),
                      ],

                    )


                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}