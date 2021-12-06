import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peliculas_app/widgets/card_swiper.dart';
import 'package:peliculas_app/widgets/movie_slider.dart';

class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text( 'Peliculas' ),
        ),
        actions: const [
          Icon( Icons.search_outlined ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            CardSwiper(),

            MovieSlider(),
            MovieSlider(),
            MovieSlider(),
          ],
        ),
      )
    );
  }
} 