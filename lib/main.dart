import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import 'package:peliculas_app/screens/details_screen.dart';
import 'package:peliculas_app/screens/home_screen.dart';



void main(List<String> args) {
  runApp(AppState());
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>  MoviesProvider() , lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => HomeScreen(),
        'details' : ( _ ) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        )
      ),
    );
  }

}