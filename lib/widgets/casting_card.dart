import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //color: Colors.red,
      height: 180,
      margin: EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ( _ , int index) {
          return _CastCard();
        }),
    );
  }
}

class _CastCard extends StatelessWidget {


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
              image: NetworkImage('https://via.placeholder.com/150x300'),
              fit: BoxFit.fill,
              width: 100,
              height: 140,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            'Consectetur sit amet consequat aliquip exercitation. Aute dolor velit sunt sunt aute commodo quis. Tempor cupidatat fugiat ea ea ut laborum consequat reprehenderit. Mollit eiusmod aute eu aliqua nostrud do magna ipsum elit irure sint consectetur commodo. Ipsum veniam et officia nulla magna irure amet voluptate consequat eiusmod ea incididunt occaecat.',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

