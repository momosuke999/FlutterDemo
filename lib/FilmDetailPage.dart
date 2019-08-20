import 'package:flutter/material.dart';
import 'package:douban_demo/model.dart';
import 'package:douban_demo/ListData.dart';
import 'package:douban_demo/films_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_demo/model.dart';
//import 'package:flutter/painting.dart';
import 'dart:ui';
class FilmDetailPage extends StatefulWidget{
  ListData enity;

  FilmDetailPage(this.enity);

 // FilmDetailPage({Key key}) : super(key: key);
  @override
  FilmDetailPageState createState() => new FilmDetailPageState(enity);
}





class FilmDetailPageState extends  State<FilmDetailPage> {

  ListData enity;
  String titleEn;
  String URLImage;
  String title;
  List genres;
  List Casts;
  List Directors;
  Map Rating;
  List Durations;


  FilmDetailPageState(this.enity);

  @override
  void initState() {
    initData();
  }

  void initData() {
    Film film = enity.data;
    titleEn = film.original_title;
    URLImage = film.images['large'];
    Casts = film.casts;
    Directors = film.directors;
    Rating = film.rating;
    title = film.title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('电影'),
        bottomOpacity: 1.0,
        elevation: 0.1,
        backgroundColor: Colors.white70,
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new CachedNetworkImageProvider(URLImage),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 30.00, sigmaY: 300.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.4)),
          ),
        ),
      ),

    );
  }







}
