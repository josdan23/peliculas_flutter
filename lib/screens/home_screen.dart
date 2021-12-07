import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movie_provider.dart';
import 'package:peliculas_app/search/movie_search_delegate.dart';
import 'package:peliculas_app/widgets/card_swiper.dart';
import 'package:peliculas_app/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final _moviesProvider = Provider.of<MoviesProvider>( context );

    //print( _moviesProvider.onDisplayMovies );

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text( 'Peliculas' ),
        ),
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
          ),
      
          
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            CardSwiper( movies: _moviesProvider.onDisplayMovies ),

            MovieSlider( 
              popularMovies: _moviesProvider.popularMovies,
              description: 'Populares',
              onNextPage: () {
                //print('hola Mundo');
                _moviesProvider.getPopularMovies();
              }
            ),
           
          ],
        ),
      )
    );
  }
} 