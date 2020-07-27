import 'package:rxdart/rxdart.dart';
import 'package:musicinterenshiptask/src/modals/Track.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TrackList {
  final _tracklist = BehaviorSubject<List<Track>>();

  //get data
  Stream<List<Track>> get trackslist => _tracklist.stream;

  //set data
  Function(List<Track>) get changetracks => _tracklist.sink.add;

  dispose() {
    _tracklist.close();
  }

  Future<void> fetchtracks() async {
    var response = await http.get(
        "http://api.musixmatch.com/ws//1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    var jsonResponse = convert.jsonDecode(response.body);
    var tracksJson = jsonResponse as List;
    List<Track> tracks = List<Track>();

    tracksJson.forEach((track) => {tracks.add(Track.fromJson(track))});

    changetracks(tracks);
    tracks.forEach((track) => print(track.name));
  }
}
