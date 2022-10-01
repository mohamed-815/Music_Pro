import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1stproject/mainscreen.dart';
import 'package:flutter_application_1stproject/songsarrey.dart';
import 'package:just_audio/just_audio.dart';

import 'package:on_audio_query/on_audio_query.dart';

AssetsAudioPlayer audioplayer = AssetsAudioPlayer();
final audioquery = OnAudioQuery();

class Songs1 {
  final String? title;
  final String? image;
  final IconData? icon1;
  Songs1({this.title, this.image, this.icon1});
}

final SongList = [
  Songs1(
      title: 'Favorite',
      image: "assets/Microphone-background-sound-waves-energy-Music.webp"),
  Songs1(title: 'Play List', image: "assets/8d-Technology-Audio.webp"),
  Songs1(
      title: 'Recent',
      image: "assets/female-rock-singers-of-the-2000s-and-2010s.jpg"),
];
