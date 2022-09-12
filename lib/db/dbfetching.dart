import 'package:flutter_application_1stproject/db/allsongstoringclass.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<SongModel>? fetchedsongs;
List<AllSongs>? allsongs;
List<AllSongs>? dbsongs;

fetchSongs() async {
  fetchedsongs = await audioquery.querySongs();
  if (fetchedsongs != null) {
    allsongs = fetchedsongs!
        .map((audio) => AllSongs(
              uri: audio.uri,
              artist: audio.artist,
              id: audio.id,
              title: audio.title,
              duration: audio.duration,
            ))
        .toList();
  }

  final boxallsongs = await Hive.box<List>('db_totalsongs');
  await boxallsongs.put('totalsongs', allsongs!);
  dbsongs = await boxallsongs.get('totalsongs') as List<AllSongs>;
}
