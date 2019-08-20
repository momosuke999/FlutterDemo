import 'package:flutter/material.dart';
import 'package:douban_demo/films_page.dart';

class TabBarWidget extends StatefulWidget{
 final List<Widget> tabItems;
 final List<Widget> tabViews;
  final Widget title;
  final Widget floatingActionButton;
  final ValueChanged<int> onPageChanged;
  final Color backgroundColor;
  final Color indicatorColor;

  TabBarWidget({
    Key key,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.title,
    this.floatingActionButton,
    this.onPageChanged,
    this.indicatorColor
  }):super(key:key);

 State<StatefulWidget> createState() {
   // TODO: implement createState
   return new _TabBarState(this.tabViews, this.title, this.onPageChanged);
 }
}

class _TabBarState extends State<TabBarWidget> with SingleTickerProviderStateMixin {

  final List<Widget> _tabViews;
  final Widget _title;
  final ValueChanged<int> _onPageChanged;
 // final Color _indicatorColor;

  _TabBarState(
      this._tabViews,
      this._title,
   //   this._indicatorColor,
      this._onPageChanged
      ):super();

  TabController _tabController;
  PageController _pageController;
  @override
  void dispose(){
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void initState(){
    super.initState();
    _tabController = new TabController(vsync: this, length: widget.tabItems.length);
    _pageController = new PageController(initialPage: 0,keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.1,

        title: _title,
        bottom: new TabBar(
          tabs: widget.tabItems,
          controller: _tabController,
          indicatorColor: Colors.black,
          onTap: (index){
            _pageController.jumpToPage(index);
          },
        ),
       ),

      body: new PageView(
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index){
          _tabController.animateTo(index);
          _onPageChanged?.call(index);
        },
      ),
    );
  }
}