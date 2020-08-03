import 'package:flutter/material.dart';

final imagesList = [
  "assets/images/brisbane.jpg",
  "assets/images/melbourne.jpg",
  "assets/images/perth.jpg",
  "assets/images/sydney.jpg",
  "assets/images/victoria.jpg",
];

final colorList = [
  Colors.blueAccent,
  Colors.amber[200],
  Colors.blueGrey[400],
  Colors.pinkAccent[200],
  Colors.deepPurpleAccent[300]
];

class ExploreCity extends StatefulWidget {
  @override
  _ExploreCityState createState() => _ExploreCityState();
}

class _ExploreCityState extends State<ExploreCity> {
  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: currentPage, keepPage: true, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return itemBuilder(index);
        },
        controller: _pageController,
        pageSnapping: true,
        onPageChanged: _onPageChanged,
        itemCount: 5,
      ),
    );
  }

  Widget itemBuilder(index) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Material(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Image.asset(
            imagesList[index],
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  _onPageChanged(int, index) {
    setState(() {
      currentPage = index;
    });
  }
}
