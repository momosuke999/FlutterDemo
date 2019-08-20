import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:douban_demo/model.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_demo/Request.dart';
import 'package:douban_demo/ListData.dart';
import 'package:douban_demo/FilmDetailPage.dart';
import 'package:douban_demo/StarPainter.dart';



class FilmPage extends StatefulWidget{
  FilmPage({Key key}) : super(key: key);

  @override
  FilmPageState createState() => new FilmPageState();
}


class FilmPageState extends  State<FilmPage>{

  List<Film> filmsList = [];
  //bool has_nextPage= false;

  @override
  void initState(){
    super.initState();
    getData(START_REQUEST);
  }



  getBody(){

    if(filmsList.isEmpty){
      return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.black12));
    }
    else{
      return new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: pullToRefresh,
        child: ListView.builder(
            itemCount: (filmsList ==null) ? 0: filmsList.length,
            itemBuilder: (BuildContext context, int position){
              return getItem(position);
            },
            physics: new AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
        ),
      );

    }
  }



  @override
  Widget build(BuildContext context){
    return new Center(
      child: getBody(),
    );
  }


  Widget getItem(int i){
    Film film = filmsList[i];
    String filmTitle = film.title;
    String imageUrl = film.images["small"];
    List genres = film.genres;
    Map rate = film.rating;
    String titleen = film.year;
    List<Directors> Directs = film.directors;
    List<Casts> casts = film.casts;

    String average = "";
    String EmptyAv = " ";
    if(rate["average"] != 0){
      average = rate["average"].toString();
    }else{
      EmptyAv ="暂无评分";
    }


    String star = rate["stars"];

    String finalRate = star.substring(0,1);
    if(star.substring(1,2) == "5"){
      finalRate = finalRate + ".5";
    }else{
      finalRate = finalRate + ".0";
    }

    double RateValue = double.parse(finalRate);


    String genre = "";

    for(int i =0; i < genres?.length; i++){
      genre = genre + genres[i];
      if(i< genres?.length -1){
        genre = genre+ " ";
      }
    }

    String director = "";

    for(i = 0; i < Directs?.length; i++){
      director = director+ Directs[i].name;
      if(i< Directs?.length-1){
        director = director + " ";
      }
    }

    String cast = "";

    for(i = 0; i < casts?.length; i++){
      cast = cast+ casts[i].name;
      if(i< casts?.length-1){
        cast = cast + " ";
      }
    }


    //显示正在上映的电影
 //   if(show_date.isBefore(time_now)){
      return new GestureDetector(
        child: Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: new Column(
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start, //纵向对其
                mainAxisSize:  MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height:140.0,

                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          new Expanded(
                              child: new Container(

                                child: new Stack(
                                    children: <Widget>[
                                          new Container(
                                              margin: new EdgeInsets.fromLTRB(105.0, 10.0, 100.0, 0.0),
                                             child: new Text(
                                              filmTitle,
                                             overflow: TextOverflow.ellipsis,
                                               style: new TextStyle(
                                                     fontSize: 18.0,
                                                   fontWeight: FontWeight.w600
                                          ),
                                           maxLines: 1,
                                        )       ,

                                   ),

                                   new Container(
                                    width: 90,
                                      height: 140,

                                    margin: new EdgeInsets.fromLTRB(5.0,10.0, 200.0, 0.0),
                                    //child: new Image(image: new CachedNetworkImageProvider(imageUrl)),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(5.0),
                                       image: DecorationImage(image: new CachedNetworkImageProvider(imageUrl),
                                       fit: BoxFit.cover
                                       )
                                     ),

                              ),



                                      new Container(
                                        margin: new EdgeInsets.fromLTRB(105.0, 60.0, 100.0, 0.0),
                                        child: new Text(
                                          titleen + " / "+director + " / " + cast + " / "+ genre,
                                         //overflow : TextOverflow.ellipsis,
                                          style: new TextStyle(
                                              fontSize: 12.0,

                                          ),
                                        ),
                                      ),

                                      new Container(
                                        margin: new EdgeInsets.fromLTRB(105.0, 40.0, 25.0, 0.0),
                                        child: new StaticRatingBar( size:15.0, rate:RateValue),
                                      ),
                                        new Container(
                                          margin: new EdgeInsets.fromLTRB(
                                              185.0, 41.0, 25.0, 0.0),
                                          child: new Text(
                                            average,
                                            style: new TextStyle(
                                              fontSize: 12.0,
                                              color: new Color(0xff7A7A7A),
                                            ),
                                          ),
                                        ),
                                      new Container(
                                        margin: new EdgeInsets.fromLTRB(
                                            185.0, 39.0, 25.0, 0.0),
                                        child: new Text(
                                          EmptyAv,
                                          style: new TextStyle(
                                            fontSize: 11.0,
                                            color: new Color(0xff7A7A7A),
                                          ),
                                        ),
                                      ),

                                      new Container(
                                        margin: new EdgeInsets.fromLTRB(
                                            287.0, 15.0, 5.0, 10.0),
                                        height: 400,
                                        child: VerticalDivider( color: Colors.black12),

                                      ),
                                      new Container (
                                        margin: new EdgeInsets.fromLTRB(307.0, 45.0, 10.0, 30.0),
                                        child:new OutlineButton(
                                            //color: Colors.pink,
                                            //textColor: Colors.pinkAccent,
                                            child: new Text("购票",
                                                style: new TextStyle(
                                              fontSize: 13.0,
                                                  color: Colors.redAccent
                                                )),
                                            borderSide: BorderSide(color: Colors.redAccent),
                                            highlightedBorderColor: Colors.redAccent,
                                            highlightColor: Colors.redAccent,
                                            disabledBorderColor: Colors.redAccent,

                                            onPressed: null),
                          )


                                    ]
                                ),
                              )
                          ),

                        ],
                      ),
                    ),
                    flex: 3,
                  ),],
              ),
              new Divider(),
            ],
          ),
        ),
        onTap: (){
          didClick(film);
        },
      );
   //}
  }


  void didClick(Film film) {
    Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new FilmDetailPage(ListData("film", film))));
  }




  void getData(int request_type)async{

    if(request_type == LOAD_MORE_REQUEST){
      Fluttertoast.showToast(
          msg:"暂无更新" ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white);
    }
    else{
      String url = "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E5%8C%97%E4%BA%AC&start=0&count=100&client=&udid=";
      print("requst: " + url);
      Dio dio = new Dio();
      Response response = await dio.get(url);
      var jsonString = response.data;
      DealDatas(jsonString, request_type);
    }
  }

  getImage(String img_url) {
    return new
    CachedNetworkImage(
      imageUrl: img_url,
      placeholder: (context, url) => new CircularProgressIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }

  Future<Null> pullToRefresh() async {
    getData(REFRESH_REQUEST);
    return null;
  }

  Future<Null> onFooterRefresh() async {
    getData(LOAD_MORE_REQUEST);
  }



  void DealDatas(jsonString, request_type){
    try{
      var filmData = new FilmEntity.fromJson(jsonString);
      var totalNum = filmData.total;
      if(totalNum > 0){
        setState((){
          filmsList = filmData.subjects;
          if(request_type==REFRESH_REQUEST){
            Fluttertoast.showToast(
                msg: "刷新成功",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white);
          }
        });
      }
      else{
        Fluttertoast.showToast(
            msg: "数据源异常",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      }
    }
    catch(e){

      print("异常==》" + e.toString());

    }
  }



}
