import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

/*Future<Album> fetchAlbum() async { // TODO final code
  final response = await http.get(Uri.parse('https://~~~~~/parents/info'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load parents code');
  }
}

class Album {
  final String parents_code;

  Album({
    this.parents_code,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      parents_code: json['parents_code'],
    );
  }
}*/

Future<Album> fetchAlbum() async {
  // example code
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  // example code
  final int userId;
  final int id;
  final String title;

  Album({
    this.userId,
    this.id,
    this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
