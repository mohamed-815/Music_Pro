import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1stproject/detailsong.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/mainscreen.dart';
import 'package:flutter_application_1stproject/songsarrey.dart';

class Recent1 extends StatelessWidget {
  const Recent1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenhight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF84A98C),
      body: SafeArea(
          child: Column(
        children: [
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
          ),
          SizedBox(
            height: screenhight / 10,
          ),
          Center(
            child: Card(
              child: Container(
                height: screenhight / 3.5,
                width: screenwidth / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(.9),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/female-rock-singers-of-the-2000s-and-2010s.jpg'))),
              ),
            ),
          ),
          SizedBox(
            height: screenhight / 25,
          ),
          Center(
            child: Text(
              'Recent',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         child: ListTile(
          //           onTap: () => Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: ((context) => DetailSong(
          //                         songdetailsshow: songarrey1[index],
          //                         index: index,
          //                         audioPlayer: audioplayer,
          //                       )))),
          //           leading: SizedBox(
          //             width: 45,
          //             child: ClipRRect(
          //                 borderRadius: BorderRadius.circular(8.0),
          //                 child: Image.asset(
          //                     "assets/best-rap-songs-1583527287.png")),
          //           ),
          //           title: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               Column(
          //                 mainAxisSize: MainAxisSize.min,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     Songdetailarrey[index].title!,
          //                     style: TextStyle(color: Colors.white),
          //                   ),
          //                   Text(
          //                     Songdetailarrey[index].titlesmall!,
          //                     style: TextStyle(
          //                         color: Colors.grey.shade500,
          //                         fontFamily: 'Montserrat',
          //                         fontSize: 13),
          //                   )
          //                 ],
          //               ),
          //             ],
          //           ),
          //           trailing: GestureDetector(
          //             onTap: () => Dialogbox2(context),
          //             child: Row(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Icon(
          //                   Icons.fiber_manual_record,
          //                   size: 10,
          //                 ),
          //                 Icon(
          //                   Icons.fiber_manual_record,
          //                   size: 10,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //     itemCount: songarrey1.length,
          //   ),
          // ),
        ],
      )),
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
                onPressed: () async {
                  Navigator.of(ctx1).pop();
                },
                child: Text(
                  'Remove',
                  style: TextStyle(color: Color.fromARGB(255, 50, 74, 68)),
                )),
            SizedBox(
              width: 13,
            )
          ],
        );
      });
}
