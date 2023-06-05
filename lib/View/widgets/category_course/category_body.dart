import 'package:flutter/material.dart';

class CategoryCourseBody extends StatefulWidget {
  const CategoryCourseBody({super.key});

  @override
  State<CategoryCourseBody> createState() => _CategoryCourseBodyState();
}

class _CategoryCourseBodyState extends State<CategoryCourseBody> {
  List<String> categories = [
    'All',
    'Business',
    'Graphic Design',
    'Programming'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
        children: [
          //custom category bar
          SizedBox(
            height: 34.0,
            child: ListView.builder(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: index < categories.length - 1
                        ? const EdgeInsets.only(right: 16.0)
                        : null,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: currentIndex == index ? Colors.blue : null,
                        border: Border.all(
                          color: currentIndex == index
                              ? Colors.transparent
                              : Colors.blue,
                        )),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color:
                            currentIndex == index ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30.0),

          //list of course
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 180.0,
            ),
            itemBuilder: (_, index) {
              return Material(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 140.0,
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('UI Design'),
                              const SizedBox(height: 16.0),
                              Row(children: [
                                Image.asset('assets/icon/ic_star.png'),
                                const SizedBox(width: 8.0),
                                const Text('4,5'),
                                const Spacer(),
                                const Text('Rp. 300.000')
                              ])
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
