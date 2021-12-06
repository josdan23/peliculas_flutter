import 'package:flutter/material.dart';


class MovieSlider extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20),
            child: Text('Popular', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 20,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( context, index) => _MoviePoster(),
            ),
          ),
        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {
  

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
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                height: 180,
                width: 130,
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),
          
          Text(
            'El retorno del jedi silvestr dle monste cristo',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}