import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './tracklist_provider.dart';
export './tracklist_provider.dart';

class TrackListProvider extends InheritedWidget {
  final TrackList bloc;

  TrackListProvider({Key key, Widget child})
      : bloc = TrackList(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static TrackList of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TrackListProvider)
            as TrackListProvider)
        .bloc;
  }
}
