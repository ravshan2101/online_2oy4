import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:online_2oy4/String.dart';

class IntoPage extends StatefulWidget {
  const IntoPage({Key? key}) : super(key: key);

  @override
  State<IntoPage> createState() => _IntoPageState();
}

class _IntoPageState extends State<IntoPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'home');
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.green, fontSize: 17),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: [
                makePage(
                  image: 'assets/images/image1.jpeg',
                  title: Strings.stepOnetitle,
                  content: Strings.stepOneContent,
                ),
                makePage(
                  image: 'assets/images/image4.jpeg',
                  title: Strings.stepTwotitle,
                  content: Strings.stepTwoContent,
                ),
                makePage(
                  image: 'assets/images/image3.jpeg',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _builIndicator(),
              ),
            )
          ],
        ));
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                content,
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _builIndicator() {
    List<Widget> indicators = [];

    for (var i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
