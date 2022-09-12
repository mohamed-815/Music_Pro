import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1stproject/db/allsongstoringclass.dart';
import 'package:flutter_application_1stproject/db/dbfetching.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/mainscreen.dart';
import 'package:flutter_application_1stproject/songsarrey.dart';

import 'package:on_audio_query/on_audio_query.dart';

import 'funtion.dart';

class DetailSong extends StatefulWidget {
  final AllSongs? songdetailsshow;
  final AssetsAudioPlayer audioPlayer;
  int? index;
  final AsyncSnapshot<List<SongModel>>? item;

  DetailSong(
      {Key? key,
      this.songdetailsshow,
      required this.index,
      required this.audioPlayer,
      this.item})
      : super(key: key);

  @override
  State<DetailSong> createState() => _DetailSongState();
}

class _DetailSongState extends State<DetailSong> {
  int? numberindex;
  bool isplay = true;
  bool isfavorite = false;
  int count = 1;
  int count1 = 1;
  int count2 = 1;
  @override
  void initState() {
    if (widget.songdetailsshow == null) {
      songPlayNow();
    } else {
      songPlayNext();
    }

    // TODO: implement initState
    super.initState();
  }

  Future<void> songPlayNow() async {
    await widget.audioPlayer
        .open(songarrey1[widget.index!], showNotification: true);
    widget.audioPlayer.play();
  }

  Future<void> songPlayNext() async {
    await widget.audioPlayer
        .open(widget.songdetailsshow!, showNotification: true);
    count++;
    widget.audioPlayer.play();
  }

 Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioplayer.positionStream,
          audioplayer.bufferedPositionStream,
          audioplayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  Widget build(BuildContext context) {
    final double screenhight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF84A98C),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: screenhight / 35,
          ),
          ListTile(
            leading: GestureDetector(
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => MainScreen())),
                  (route) => false),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.1),
                child: Center(
                    child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                )),
              ),
            ),
            trailing: Icon(
              Icons.queue_music,
              size: 30,
              color: Colors.white,
            ),
          ),
          Card(
            child: Container(
                height: screenhight / 3,
                width: screenwidth / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/best-rap-songs-1583527287.png')))),
          ),
          SizedBox(
            height: screenhight / 20,
          ),
          widget.songdetailsshow == null
              ? Text(
                  dbsongs![widget.index!].title!,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              : Text(
                  widget.songdetailsshow!.title!,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
          widget.songdetailsshow == null
              ? Text(
                  songarrey1[widget.index!].metas.artist!,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              : Text(
                  widget.songdetailsshow!.artist!,
                  style: TextStyle(color: Colors.white),
                ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(c.inSeconds.toString().split(".")[0]),
          //       Text(duration.inSeconds.toString().split(".")[0]),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: screenhight / 50,
          ),
          // Container(
          //     margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          //     child: widget.audioPlayer.builderRealtimePlayingInfos(
          //         builder: (context, infos) {
          //       Duration currentposition = infos.currentPosition;
          //       Duration totalduration = infos.duration;
          //       return ProgressBar(
          //           timeLabelTextStyle:
          //               TextStyle(color: Colors.white, fontSize: 16),
          //           thumbColor: Color.fromARGB(255, 64, 82, 68),
          //           baseBarColor: Color.fromARGB(255, 127, 126, 126),
          //           progressBarColor: Color.fromARGB(255, 86, 110, 91),
          //           bufferedBarColor: Color.fromARGB(255, 123, 157, 131),
          //           thumbRadius: 8,
          //           barHeight: 3,
          //           progress: currentposition,
          //           total: totalduration,
          //           onSeek: (to) {
          //             audioplayer.seek(to);
          //           });
          //     })),
          SizedBox(
            height: screenhight / 25,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.shuffle,
                  color: Colors.grey.shade200,
                ),
                GestureDetector(
                    onTap: () => setState(() {
                          if (isfavorite == true) {
                            isfavorite = false;
                          } else {
                            isfavorite = true;
                          }
                        }),
                    child: isfavorite
                        ? Icon(Icons.favorite)
                        : Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )),
                Icon(Icons.repeat, color: Colors.grey.shade200)
              ],
            ),
          ),
          SizedBox(
            height: screenhight / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onDoubleTap: () async {
                  await audioplayer.seekBy(Duration(seconds: -5));
                },
                onTap: () {
                  count2++;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => widget.index! > 0
                              ? DetailSong(
                                  songdetailsshow:
                                      dbsongs![widget.index! - 1],
                                  index: widget.index! - 1,
                                  audioPlayer: widget.audioPlayer)
                              : MainScreen())));
                },
                child: Icon(
                  Icons.skip_previous,
                  size: 30,
                ),
              ),
              SizedBox(
                width: screenwidth / 30,
              ),
              InkWell(
                child: GestureDetector(
                  onTap: () => setState(() {
                    if (isplay == true) {
                      audioplayer.pause();
                      isplay = false;
                    } else {
                      audioplayer.play();
                      isplay = true;
                    }
                  }),
                  child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade200,
                      child: isplay
                          ? Icon(
                              size: 40,
                              Icons.pause,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.play_arrow,
                              size: 40,
                              color: Colors.black,
                            )),
                ),
              ),
              SizedBox(
                width: screenwidth / 30,
              ),
              GestureDetector(
                  onDoubleTap: () async {
                    await audioplayer.seekBy(Duration(seconds: 5));
                  },
                  onTap: () {
                    count1++;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                widget.index! < dbsongs!.length - 1
                                    ? DetailSong(
                                        songdetailsshow:
                                            dbsongs![widget.index! + 1],
                                        index: widget.index! + 1,
                                        audioPlayer: widget.audioPlayer)
                                    : MainScreen())));
                  },
                  child: Icon(Icons.skip_next, size: 30)),
            ],
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    count1 = 1;
    count2 = 1;

    // TODO: implement dispose
    super.dispose();
  }
}
