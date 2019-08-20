import 'package:flutter/material.dart';
import 'package:douban_demo/TabViewPage.dart';
import 'package:douban_demo/films_page.dart';
import 'package:douban_demo/FutureFilmPage.dart';
//Main里默认显示正在上映的电影list

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "院线电影",
      theme: ThemeData(primaryColor: Colors.white),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> tabs = [
      _renderTab(new Text("正在热映")),
      _renderTab(new Text("即将上映")),
    ];
    return new WillPopScope(
        child: new TabBarWidget(
          title: new Text("院线电影"),
          tabItems: tabs,
          tabViews: [
            new FilmPage(),
            new FutureFilmPage(),
          ],
          backgroundColor: Theme.of(context).primaryColor,
          indicatorColor: Theme.of(context).primaryColor,
        ),
    );
  }
}


_renderTab(text) {
  return new Tab(
      child:new Container(
        padding: new EdgeInsets.only(top: 6),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[text],
        ),
      )
  );
}