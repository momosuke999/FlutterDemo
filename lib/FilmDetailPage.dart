import 'package:flutter/material.dart';
import 'package:douban_demo/model.dart';
import 'package:douban_demo/ListData.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  String alt;
  String year;
  String pubdate;

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
    alt = film.alt;
    year = film.year;
    pubdate = film.mainland_pubdate;
    Durations = film.durations;
    genres = film.genres;
  }

  @override
  Widget build(BuildContext context) {
    String En = "";
    if(titleEn == title){
      En = "(" + year + ")";
    }else{
      En = titleEn + " (" + year + ")";
    }


    String genre = "";

    for(int i =0; i < genres?.length; i++){
      genre = genre + genres[i];
      if(i< genres?.length -1){
        genre = genre+ " ";
      }
    }

    String director = "";


    for(int i = 0; i < Directors?.length; i++){
      director = director+ Directors[i].name;
      if(i< Directors?.length-1){
        director = director + " ";
      }
    }

    String cast = "";

    for(int i = 0; i < Casts?.length; i++){
      cast = cast+ Casts[i].name;
      if(i< Casts?.length-1){
        cast = cast + " ";
      }
    }

    String duration = Durations[0];


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('电影'),
        bottomOpacity: 1.0,
        elevation: 0.1,
        backgroundColor: Colors.white70,
      ),
      body:new CustomScrollView(

        slivers: <Widget>[

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){

              return new Stack(

                children: <Widget>[
                  new Container(
                    width: 100,
                    height: 144,

                    margin: new EdgeInsets.fromLTRB(15.0,20.0, 235.0, 10.0),
                    //child: new Image(image: new CachedNetworkImageProvider(imageUrl)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(image: new CachedNetworkImageProvider(URLImage),
                            fit: BoxFit.cover

                        )
                    ),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start, //纵向对其
                    mainAxisSize:  MainAxisSize.max,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget>[
                    new Container(
                        //color:Colors.grey,
                      padding: EdgeInsets.fromLTRB(125.0,20.0, 5.0, 5.0),
                     //  margin: new EdgeInsets.fromLTRB(125.0,20.0, 0.0, 20.0),
                       child: new Text(
                         title,
                         overflow: TextOverflow.ellipsis,
                          style: new TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.w600
                      ),
                      maxLines: 2,
                     ),
                    ),
                      new Container(
                        //color:Colors.grey,
                        margin: new EdgeInsets.fromLTRB(125.0,0.0, 5.0, 5.0),
                        child: new Text(
                          En,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(fontSize: 14.0,
                              fontWeight: FontWeight.w600
                          ),
                          maxLines: 2,
                        ),
                      ),

                      new Container(
                        margin: new EdgeInsets.fromLTRB(125.0, 0.0, 5.0, 5.0),
                        child: new Text(
                          genre+ " / " + pubdate + "(中国大陆) / " + director + " / " + cast + " / "+ duration,
                          //overflow : TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey
                          ),
                        ),
                      ),

                      new Row(
                          crossAxisAlignment: CrossAxisAlignment.start, //纵向对其
                          mainAxisSize:  MainAxisSize.max,
                          children:<Widget>[
                            new Container(
                              width: 113,
                              margin: new EdgeInsets.fromLTRB(125.0, 0.0, 0.0, 0.0),
                              child:new OutlineButton(
                              //color: Colors.pink,
                              //textColor: Colors.pinkAccent,
                                child: new Text("想看",
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.orangeAccent
                                    )),
                                borderSide: BorderSide(color: Colors.orangeAccent),
                                highlightedBorderColor: Colors.orangeAccent,
                               highlightColor: Colors.orangeAccent,
                                disabledBorderColor: Colors.orangeAccent,
                                  color: Colors.black,
                                onPressed: null),),

                            new Container(
                              width:113,
                              margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              child:new OutlineButton(

                                //color: Colors.pink,
                                //textColor: Colors.pinkAccent,
                                  child: new Text("看过",
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.orangeAccent
                                      )),
                                  borderSide: BorderSide(color: Colors.orangeAccent),
                                  highlightedBorderColor: Colors.orangeAccent,
                                  highlightColor: Colors.orangeAccent,
                                  disabledBorderColor: Colors.orangeAccent,
                                  color: Colors.black,
                                  onPressed: null),
                            ),

                          ]

                      ),

                      new Container(
                             margin: new EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                            width: 320,
                            height: 100,
                            color: Colors.black12,
                            child: new Text("豆瓣评分栏，星星，柱状图",
                                            style: new TextStyle(fontSize: 26.0,color: Colors.grey))
                        ),

                      new Container(
                          height: 150,
                        //  padding: new EdgeInsets.all(20),
                          margin: new EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
                          child: new ListView(
                             // padding: new EdgeInsets.all(20),
                                //padding: EdgeInsets.all(20.0),
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[

                                  Image.network(URLImage),
                                  Image.network(URLImage),
                                  Image.network(URLImage),
                                  Image.network(URLImage),
                                  Image.network(URLImage),
                                  Image.network(URLImage),

              ]


                         )
                      )


                ],
                  ),



                ],
              );
            },
            childCount:1,
            ),

          )


        ],
      ),

    );
  }





}
