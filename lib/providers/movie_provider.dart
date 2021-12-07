
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/now_playing_response.dart';
import 'package:peliculas_app/models/popular_response.dart';
import 'package:peliculas_app/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {

  final String _urlBase = 'api.themoviedb.org';
  final String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  final String _language = 'en-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;


  final Map<int, List<Cast>> castMovie = {} ;


  MoviesProvider(){
    print('Movie provider creado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }


  Future<String> getJsonData( String endpoint, [int page = 1]) async {

    final url = Uri.https( _urlBase, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page'
    }); 

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final response = await getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson( response );

    //final dataDecoded = json.decode( response.body );

    print( nowPlayingResponse.results[0].title );

    this.onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  
  }

  getPopularMovies() async {

    _popularPage++;

    final response = await getJsonData( '3/movie/popular', _popularPage );

    final popularResponse = PopularResponse.fromJson( response );

    //final dataDecoded = json.decode( response.body );

    this.popularMovies = [ ...this.popularMovies, ...popularResponse.results ];

    notifyListeners();
  }


  Future<List<Cast>> getMovieCast( int movieId ) async {

    if ( castMovie.containsKey(movieId)) return castMovie[movieId]!;

    print('solicitando cast de movie');

    final jsonData = await getJsonData( '3/movie/$movieId/credits' );
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    castMovie[ movieId ] = creditsResponse.cast;

    return creditsResponse.cast;

  }

  Future<List<Movie>> searchMovies( String query ) async {

    final url = Uri.https( _urlBase, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    }); 

    final response = await http.get(url);
    
    final searchresponse = SearchResponse.fromJson( response.body );

    return searchresponse.results;

  }

}