

import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton( 
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close( context, null );
      },
    );
  }

  Widget _emptyContainer() {

    return Container(
      width: double.infinity,
      child: Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black45, size: 200),
      )
    );

  }


  @override
  Widget buildResults(BuildContext context) {
    
    return Text('resultado');
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if ( query.isEmpty ) return _emptyContainer();

    final  moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.searchMovies( query ),
      builder: ( _ , AsyncSnapshot<List<Movie>> snapshot ) {
        
        if ( !snapshot.hasData ) return _emptyContainer();

        final movies = snapshot.data!;


        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: ( _ , int index) {
              return MovieItem(movies[index]);
          }
        );

      }
    );

  }
  
}


class MovieItem extends StatelessWidget {
  
  final Movie movie;

  const MovieItem( this.movie );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPathImg),
        width: 50,
        fit: BoxFit.cover
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {

        Navigator.pushNamed( context, 'details', arguments: movie);

      },
    );
  }
}