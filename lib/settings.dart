import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenhight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Color(0xFF2F3E46),
        ),
        backgroundColor: Color(0xFF2F3E46),
        body: SafeArea(
            child: ListView(
          children: [
            SizedBox(
              height: screenhight / 5,
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.white,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Privacy',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Security',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Message, group & call tones',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.support_agent_rounded,
                color: Colors.white,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Help',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Help cenre, privacy policy,terms and contitions.',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.roundabout_left,
                color: Colors.white,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'terms and conditions.',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenhight / 2.8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'vertion',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '2.5.1',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            )
          ],
        )));
  }
}
