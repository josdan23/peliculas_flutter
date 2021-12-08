import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';


class CardSwiper extends StatelessWidget {
  
  final List<Movie> movies ;

  const CardSwiper({
    Key? key, 
    required this.movies
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if( movies.length == 0 )
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center( 
          child: CircularProgressIndicator(),
        )
      );

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: movies.length == 0 ? 3 : movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 200,
        itemBuilder: ( _ , index ) {

          // print('cantidad de movies: ${movies.length}');
          final movie = movies[index];

          movie.heroId = 'swiper-${movie.id}';

          return GestureDetector(
            child: Hero(
              tag: movie.heroId!,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage( movie.fullPathImg ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: movie);
            },
          );

        },
      ),
    );
  }
}