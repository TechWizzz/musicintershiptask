import 'dart:js';
import 'package:flutter/material.dart';
import 'package:musicinterenshiptask/src/blocks/track_provider.dart';
import 'package:musicinterenshiptask/src/modals/Track.dart';
import 'package:musicinterenshiptask/src/screens/track_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = TrackListProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Trending")),
      body: StreamBuilder<List<Track>>(
        stream: bloc.tracks,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.library_music),
                title: Text(snapshot.data[index].name),
                subtitle: Text(snapshot.data[index].name),
                trailing: Text(snapshot.data[index].artist),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TrackPage(track: snapshot.data[index].track_id)));
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final bloc = TrackListProvider.of(context);
      bloc.fetchtracks();
    });
    super.initState();
  }
}
