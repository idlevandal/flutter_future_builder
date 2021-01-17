import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:flutter_future_builder/models/album.dart';

Future<List<Album>> fetchAlbum() async {

  Response response = await get('https://jsonplaceholder.typicode.com/albums?_start=0&_limit=15');

  if (response.statusCode == 200) {
    List<dynamic> res = jsonDecode(response.body);
    return res.map((album) => Album.fromJson(album)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}