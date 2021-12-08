import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/widgets/casting_card.dart';

class DetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar( movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle( movie: movie),
              _Overview( overview: movie.overview),
        
              CastingCards( movie.id ),
            ])
          )
  
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      pinned: true,
      floating: false,
      expandedHeight: 200,
      //title: Text('titulo'),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.only(bottom: 14),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text( '${movie.title}' ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



class _PosterAndTitle extends StatelessWidget {

  

  final Movie movie;

  const _PosterAndTitle({ Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage( movie.fullPathImg ),
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox( width: 20),


          ConstrainedBox(
            constraints: BoxConstraints( maxWidth: size.width - 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${movie.title}', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text('${movie.originalTitle}', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Row(
                  children: [
                    Icon(Icons.star_outline, size: 15, ),
                    SizedBox( width: 5,), 
                    Text('${movie.voteAverage}', style: textTheme.caption,),
                  ],
                ),
              ],
            ),
          )
        ],
        
      ),
    );
  }
}


class _Overview extends StatelessWidget {

  final String overview;

  const _Overview({Key? key, required this.overview}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.caption,)

    );
  }
}
