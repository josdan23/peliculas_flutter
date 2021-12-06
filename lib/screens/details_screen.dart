import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/casting_card.dart';

class DetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),
            ])
          )
  
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {

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
          child: Text( 'movie.title' ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
          ),

          SizedBox( width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('Original.title', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, ),
                  SizedBox( width: 5,), 
                  Text('Average', style: textTheme.caption,),
                ],
              ),
            ],
          )
        ],
        
      ),
    );
  }
}


class _Overview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text('Ut velit mollit ea amet nulla nisi. Laborum id reprehenderit nostrud do ipsum irure incididunt officia. Elit nostrud officia ad ex excepteur elit id dolore officia incididunt magna. Cupidatat pariatur deserunt irure nulla. Quis cupidatat consequat sint qui quis excepteur id adipisicing sit ea ea sit excepteur. Anim sint officia nisi aliquip. Qui occaecat Lorem velit aute nulla anim veniam. Esse dolor nulla incididunt pariatur pariatur duis pariatur esse. Esse deserunt eiusmod proident qui enim laboris cupidatat pariatur sit velit.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.caption,)

    );
  }
}
