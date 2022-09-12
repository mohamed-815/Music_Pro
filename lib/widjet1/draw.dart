import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1stproject/play%20list/addplaylist.dart';
import 'package:flutter_application_1stproject/play%20list/favorite.dart';
import 'package:flutter_application_1stproject/play%20list/recent.dart';
import 'package:flutter_application_1stproject/settings.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenhieght = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Color.fromARGB(255, 76, 114, 118),
      child: ListView(
        children: [
          SizedBox(
            height: screenhieght / 10,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => Recent1()))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 76, 114, 118),
                child: Icon(Icons.recent_actors),
              ),
              title: Text(
                'Recent',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => AddPlayList()))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 76, 114, 118),
                child: Icon(Icons.playlist_add),
              ),
              title: Text(
                'PlayList',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => Favorites()))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 76, 114, 118),
                child: Icon(Icons.favorite),
              ),
              title: Text(
                'Favorite',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => Settings()))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 76, 114, 118),
                child: Icon(Icons.settings),
              ),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
