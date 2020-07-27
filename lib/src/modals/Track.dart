class Track {
  final int track_id;
  final String name;
  final String artist;
  final String explicit;
  final int rating;

  Track({this.track_id, this.name, this.artist, this.explicit, this.rating});

  Track.fromJson(Map<String, dynamic> parsedJson)
      : track_id = parsedJson['track_id'],
        name = parsedJson['album_name'],
        artist = parsedJson['artist_name'],
        explicit = parsedJson['explicit'],
        rating = parsedJson['track_rating'];
}
