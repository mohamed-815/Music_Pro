import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_application_1stproject/db/allsongstoringclass.dart';
import 'package:flutter_application_1stproject/funtion.dart';
import 'package:hive/hive.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<SongModel>? fetchedsongs;
List<AllSongs>? allsongs;
List<AllSongs>? dbsongs;
List<Audio> audioconvertedsongs = [];

fetchSongs() async {
  bool ispermition = await audioquery.permissionsStatus();
  if (!ispermition) {
    await audioquery.permissionsRequest();
  }

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

  final Box<List> boxallsongs = Hive.box<List>('db_totalsongs');
  await boxallsongs.put('totalsongs', allsongs!);
  dbsongs = boxallsongs.get('totalsongs') as List<AllSongs>;

  if (dbsongs != null) {
    for (var element in dbsongs!) {
      audioconvertedsongs.add(Audio.file(
        element.uri.toString(),
        metas: Metas(
            id: element.id.toString(),
            title: element.title,
            artist: element.artist,
            album: element.duration.toString()),
      ));
    }
  }
}
