import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';


class MovieSlider extends StatefulWidget {

  List<Movie> popularMovies;
  String? description;
  final Function onNextPage;
  

  MovieSlider( {
    required this.popularMovies,
    this.description, 
    required this.onNextPage
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {


  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      
      if ( scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500 ) 
        this.widget.onNextPage();
    });
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 270,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (this.widget.description != null)
            Padding(
              padding: EdgeInsets.symmetric( horizontal: 20),
              child: Text(
                '${this.widget.description}', 
                style: TextStyle( 
                  fontSize: 20, 
                  fontWeight: FontWeight.bold 
                ),
              ),
            ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: this.widget.popularMovies.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _ , index)  {
                return _MoviePoster( movie: widget.popularMovies[ index ]);
              }
            ),
          ),
        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {

  final Movie movie;

  _MoviePoster({ required this.movie }) {
    movie.heroId = 'slider-${movie.id}';
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 180,
      //color: Colors.red,
      margin: EdgeInsets.symmetric( horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie), 
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPathImg),
                  fit: BoxFit.cover,
                  height: 180,
                  width: 130,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 5,
          ),
          
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}