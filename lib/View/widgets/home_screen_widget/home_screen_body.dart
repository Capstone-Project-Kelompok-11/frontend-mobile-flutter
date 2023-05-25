import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Widget> carouselBoxes = [
    Container(
      width: 260,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        )),
    Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        )),
    Container(
        width: 260,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10.0),
        )),
  ];

  final CarouselController _controller = CarouselController();
  int setIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          //Carousel Slider
          CarouselSlider(
            items: carouselBoxes,
            carouselController: _controller,
            options: CarouselOptions(
              height: 100.0,
              clipBehavior: Clip.none,
              autoPlay: true,
              onPageChanged: (index, _) {
                setState(() {});
                setIndex = index;
              },
            ),
          ),
          const SizedBox(height: 8.0),

          //Carousel Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselBoxes.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.black)
                          .withOpacity(setIndex == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16.0),

          //Category Boxes
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(14.0),
                  margin: const EdgeInsets.only(right: 16.0),
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 0.7,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 46.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      const Text('Test')
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),

          //Popular Course
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Course',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 180.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Material(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: 140.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 110.0,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://ik.imagekit.io/mrggsfxta/Voyager_68_v2-keyboard.jpg?updatedAt=1682567212420',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('UI Design'),
                                      SizedBox(height: 16.0),
                                      Row(children: [
                                        Icon(Icons.star_rounded),
                                        Text('4,5'),
                                        Spacer(),
                                        Text('Rp. 300.000')
                                      ])
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          //Continue Course
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Continue Course',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 32.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        SizedBox(
                          height: 80.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Test',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    '4 / 5 Lessons',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    width: 200.0,
                                    lineHeight: 8.0,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey,
                                    progressColor: Colors.blue,
                                    barRadius: const Radius.circular(20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
