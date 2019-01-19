import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
// import 'package:dotenv/dotenv.dart' show load, env;

import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  // final String _apiKey = env['MOVIEDB_API_KEY'];
  final String _apiKey = '';

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    final response = await client.get('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');
    print(response.body.toString());

    if (response.statusCode == 200) {
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}