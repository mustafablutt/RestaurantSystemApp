import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:restaurant_system/screens/main_screen.dart';

class HelpScreen extends StatefulWidget {
  static const String id = 'helpScreen';
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  int animationNumber = 0;
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    );
    controller.forward();
    // controller.reverse();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && animationNumber < 5) {
        animationNumber++;
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    // PageController _pageController = PageController();
    // double currentPage = 0;
    //
    // _pageController.addListener(() {
    //   setState(() {
    //     currentPage = _pageController.page;
    //   });
    // });

    return new Scaffold(
      appBar: new AppBar(
        title: Text("Help Screen"),
      ),
      body: PageIndicatorContainer(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: [
            Center(
              child: Column(
                children: [
                  ScaleTransition(
                    scale: animation,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.help,
                        size: 200,
                        color: Color(0xFFD71219),
                      ),
                    ),
                  ),
                  Text('Frequently Asked Questions'),
                  Text(''),
                  Text(''),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  ScaleTransition(
                    scale: animation,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.local_post_office,
                        size: 200,
                        color: Color(0xFFD71219),
                      ),
                    ),
                  ),
                  Text('Contact Us'),
                  Text(''),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    tileColor: Colors.white,
                    title: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      // onChanged: (value) {
                      //   null
                      // },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ).copyWith(),
                    ),
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    tileColor: Colors.white,
                    title: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      // onChanged: (value) {
                      //   null
                      // },
                      decoration: InputDecoration(
                        labelText: 'Message',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ).copyWith(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      );
                    },
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
        align: IndicatorAlign.bottom,
        length: 2,
        indicatorSpace: 20.0,
        padding: const EdgeInsets.all(10),
        indicatorColor: Colors.grey,
        indicatorSelectorColor: Color(0xFFD71219),
        shape: IndicatorShape.circle(size: 12),
      ),
    );
  }
} //some problems gonna fix
