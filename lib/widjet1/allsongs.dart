import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1stproject/detailsong.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/mainscreen.dart';
import 'package:flutter_application_1stproject/songsarrey.dart';

class AllSongs extends StatelessWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => DetailSong(
                          audioPlayer: audioplayer,
                          index: index,
                        )))),
            child: ListTile(
              leading: SizedBox(
                width: 45,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset("assets/best-rap-songs-1583527287.png")),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songarrey1[index].metas.title!,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        songarrey1[index].metas.artist!,
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontFamily: 'Montserrat',
                            fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () => Dialogbox2(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: songarrey1.length,
      ),
    );
  }
}
