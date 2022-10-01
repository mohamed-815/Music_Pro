import 'package:flutter/material.dart';
import 'package:flutter_application_1stproject/db/allsongstoringclass.dart';
import 'package:flutter_application_1stproject/db/dbfetching.dart';
import 'package:flutter_application_1stproject/detailsong.dart';
import 'package:flutter_application_1stproject/miniplayer.dart';

import 'package:flutter_application_1stproject/spalashscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'mainscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AllSongsAdapter());
  await Hive.openBox<List>('db_totalsongs');
  await fetchSongs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
