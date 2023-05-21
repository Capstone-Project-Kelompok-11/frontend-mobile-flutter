import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/slider_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    const SliderScreen(
        title: "Grow Your Skill And Push Your Limit",
        image: "assets/images/1.svg"),
    const SliderScreen(
        title: "Study From anywhere with expert", image: "assets/images/2.svg"),
    const SliderScreen(
        title: "Get access to unlimited educational resources ",
        image: "assets/images/3.svg"),
    const SliderScreen(
        title:
            "Find the best courses & upgrade your skills, start learn now with",
        image: "assets/images/3.svg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Colors.blue
                            : Colors.blue.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : const Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
