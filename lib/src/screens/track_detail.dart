import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

class TrackPage extends StatelessWidget {
  final Track track;

  TrackPage({@required this.track});

  Future<String> trackandlyric(id) async {
    var value = <Map<String, dynamic>>[];
    var responsetrack = await http.get(
        "http://api.musixmatch.com/ws//1.1/track.get?track_id=TRACK_IDtrack.get?track_id=$id?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    var lyricresponse = await http.get(
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$id&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7")

    var results = await Future.wait(
        [responsetrack, lyricresponse]); // list of Responses
    for (var response in results) {
      print(response.statusCode);
      value.add(json.decode(response.body));
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Track Detail")),
      body: Column(
        children: <Widget>[
        ]
      ),

    );
  }

  @override
  void initState(track) {
    Future.delayed(Duration.zero, () async {
      String value = tracksandlyric(track);
    });
  }
}
