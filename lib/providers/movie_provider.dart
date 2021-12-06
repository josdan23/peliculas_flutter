
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  final String _urlBase = 'api.themoviedb.org';
  final String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  final String _language = 'en-ES';


  MoviesProvider(){
    print('Movie provider creado');

    this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async {
    var url = Uri.https( _urlBase, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);

    final dataDecoded = json.decode( response.body );

    print( dataDecoded['dates'] );
  
  }

}