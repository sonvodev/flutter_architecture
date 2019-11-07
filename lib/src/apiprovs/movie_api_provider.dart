import 'dart:async';
import 'package:flutter_architecture/src/models/trailer_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:flutter_architecture/src/models/item_model.dart';

class MovieApiProvider {

  Client client = Client();
  final _apiKey = '61f853ceec99eac66cee02adb6d03af7';
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  
  Future<ItemModel> fetchMovieList() async {
    final path = '$_baseUrl/popular?api_key=$_apiKey';
    final response = await client.get(path);

    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailers(int movieId) async {
    final response =
        await client.get('$_baseUrl/$movieId/videos?api_key=$_apiKey');

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
