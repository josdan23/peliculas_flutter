

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  

  CastingCards( this.movieId );



  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: movieProvider.getMovieCast(movieId),
      builder: ( _ , snapshot) {

        if ( !snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data as List<Cast>;
        

        return Container(
          width: double.infinity,
          //color: Colors.red,
          height: 180,
          margin: EdgeInsets.only(bottom: 30),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: ( _ , int index) {
              return _CastCard( cast[index] );
            }),
        );

      },
    );

  }
}

class _CastCard extends StatelessWidget {


  final Cast actor;

  const _CastCard(this.actor);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              //image: NetworkImage('https://via.placeholder.com/150x300'),
              image: NetworkImage( actor.fullProfilePath ),
              fit: BoxFit.fill,
              width: 100,
              height: 140,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            actor.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

