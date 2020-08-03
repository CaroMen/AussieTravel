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
        initialPage: currentPage, keepPage: false, viewportFraction: 0.8);
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
        physics: ClampingScrollPhysics(),
      ),
    );
  }

  Widget itemBuilder(index) {
    print("$index ${_pageController.page}");
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 600.0,
        margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
        child: Material(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              child: Image.asset(
                imagesList[index],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      print(index);
      currentPage = index;
    });
  }
}
