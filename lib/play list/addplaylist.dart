import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1stproject/detailsong.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:flutter_application_1stproject/mainscreen.dart';
import 'package:flutter_application_1stproject/songsarrey.dart';

class AddPlayList extends StatelessWidget {
  const AddPlayList({
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
            height: screenhight / 40,
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
                        image: AssetImage('assets/8d-Technology-Audio.webp'))),
              ),
            ),
          ),
          SizedBox(
            height: screenhight / 25,
          ),
          Center(
            child: GestureDetector(
              onTap: () => Dialogbox1(context),
              child: Text(
                '+ Play List',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
