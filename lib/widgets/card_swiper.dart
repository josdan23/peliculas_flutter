import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


class CardSwiper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: 6,
        layout: SwiperLayout.STACK,
        itemHeight: 300,
        itemWidth: 200,
        itemBuilder: (context, i) {

          return GestureDetector(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.fill,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'details', arguments: 'movie-instance');
            },
          );

        },
      ),
    );
  }
}