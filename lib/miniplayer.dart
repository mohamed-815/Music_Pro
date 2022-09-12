import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenhieght = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF52796F),
      body: Center(
        child: Container(
          height: screenhieght / 9,
          width: screenwidth,
          child: Card(
            color: Colors.white.withOpacity(.1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF9d4edd),
                  radius: 24,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    backgroundColor: Color(0xFFe0aaff),
                    radius: 18,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenhieght / 60,
                    ),
                    Text('hara hara'),
                    SizedBox(
                      height: screenhieght / 130,
                    ),
                    Text(
                      'ranbeer',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
