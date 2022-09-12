import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1stproject/detailsong.dart';

import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/play%20list/Recent.dart';
import 'package:flutter_application_1stproject/play%20list/addplaylist.dart';
import 'package:flutter_application_1stproject/play%20list/favorite.dart';

import 'package:flutter_application_1stproject/settings.dart';
import 'package:flutter_application_1stproject/songsarrey.dart';
import 'package:flutter_application_1stproject/widjet1/allsongs.dart';
import 'package:flutter_application_1stproject/widjet1/draw.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          drawer: Drawer1(),
          backgroundColor: Color(0xFF52796F),
          body: Builder(builder: (context) {
            return Column(
              children: [
                ListTile(
                  leading: GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(.1),
                    child: Center(
                        child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 18,
                    )),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8.0,
                    children: List.generate(
                        SongList.length,
                        (index) => Center(
                              child: PlayListCards(
                                songlistinorder: SongList[index],
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  height: screenheight / 50,
                ),
                Text(
                  'All Songs',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                AllSongs1(),
              ],
            );
          })),
    );
  }
}

class PlayListCards extends StatefulWidget {
  const PlayListCards({Key? key, required this.songlistinorder})
      : super(key: key);
  final Songs1 songlistinorder;

  @override
  State<PlayListCards> createState() => _PlayListCardsState();
}

class _PlayListCardsState extends State<PlayListCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.songlistinorder.title == 'Favorite') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => Favorites())),
          );
        } else if (widget.songlistinorder.title == 'Play List') {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => AddPlayList())));
        } else if (widget.songlistinorder.title == 'Recent') {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Recent1())));
        }
      },
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: AssetImage(widget.songlistinorder.image!),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            widget.songlistinorder.title!,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

Future<void> Dialogbox2(context) async {
  showDialog(
      context: context,
      builder: (ctx1) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: Text(
                  'Add to favorite',
                  style: TextStyle(color: Color.fromARGB(255, 50, 74, 68)),
                )),
            TextButton(
                onPressed: () async {
                  Navigator.of(ctx1).pop();
                },
                child: Text(
                  'Add to Playlist',
                  style: TextStyle(color: Color.fromARGB(255, 50, 74, 68)),
                )),
            SizedBox(
              width: 13,
            )
          ],
        );
      });
}

Future<void> Dialogbox1(context) async {
  showDialog(
      context: context,
      builder: (ctx1) {
        return AlertDialog(
          content: TextField(decoration: InputDecoration()),
          title: Text(
            'Add Play List',
            style: TextStyle(color: Color.fromARGB(255, 44, 66, 61)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text(
                  'close',
                  style: TextStyle(color: Color.fromARGB(255, 98, 145, 134)),
                )),
            TextButton(
                onPressed: () async {
                  Navigator.of(ctx1).pop();
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Color.fromARGB(255, 98, 145, 134)),
                ))
          ],
        );
      });
}
