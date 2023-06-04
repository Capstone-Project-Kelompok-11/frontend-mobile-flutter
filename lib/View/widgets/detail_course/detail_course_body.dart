import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class DetailCourseBody extends StatefulWidget {
  const DetailCourseBody({super.key});

  @override
  State<DetailCourseBody> createState() => _DetailCourseBodyState();
}

class _DetailCourseBodyState extends State<DetailCourseBody> {
  int currentIndex = 0;
  List<String> module = [
    'Pengenalan tentang Desain Antarmuka Pengguna (UI Design)',
    'Desain Visual',
    'Proses Desain Antarmuka Pengguna',
    'Desain Responsif',
    'Animasi dan Interaksi',
    'Pengenalan tentang Desain Antarmuka Pengguna (UI Design)',
    'Desain Visual',
    'Proses Desain Antarmuka Pengguna',
    'Desain Responsif',
    'Animasi dan Interaksi'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('UI Design',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16.0),
          const Row(children: [
            Icon(Icons.star_border),
            SizedBox(width: 6.0),
            Text('4,5'),
            Spacer(),
            Text('Rp. 300.000')
          ]),
          const SizedBox(height: 22.0),

          //overview and lessons button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  currentIndex = 0;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: currentIndex == 0 ? Colors.blue : Colors.transparent,
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    'Overview',
                    style: TextStyle(
                        color: currentIndex == 0 ? Colors.white : Colors.blue),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              GestureDetector(
                onTap: () {
                  currentIndex = 1;
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: currentIndex == 1 ? Colors.blue : Colors.transparent,
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    'Lessons',
                    style: TextStyle(
                      color: currentIndex == 1 ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          if (currentIndex == 0) ...[
            //OverView class
            const OverView(),
          ] else ...[
            Lessons(module: module)
          ],

          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}

class Lessons extends StatelessWidget {
  const Lessons({
    super.key,
    required this.module,
  });

  final List<String> module;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: module.length,
      itemBuilder: (context, index) {
        return Container(
          width: 300.0,
          height: 50.0,
          margin: index < module.length - 1
              ? const EdgeInsets.only(bottom: 16.0)
              : null,
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 120.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textAlign: TextAlign.start,
              module[index],
              style:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
            ),
          ),
        );
      },
    );
  }
}

class OverView extends StatelessWidget {
  const OverView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Description
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10.0),
        const Text(
          'Kelas UI design (User Interface design) adalah kelas yang bertujuan untuk mengajarkan kepada peserta bagaimana merancang tampilan antarmuka yang mudah digunakan dan menarik bagi pengguna. UI design merupakan bagian dari disiplin desain yang fokus pada aspek visual dan interaktif dari sebuah produk digital, seperti website, aplikasi, dan perangkat lunak.',
          style: TextStyle(fontSize: 10.0, height: 1.5),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Container(
                    height: 32.0,
                    width: 32.0,
                    color: Colors.grey,
                  ),
                  const Text('5 Lessons'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Container(
                    height: 32.0,
                    width: 32.0,
                    color: Colors.grey,
                  ),
                  const Text('Beginner'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
              child: Column(
                children: [
                  Container(
                    height: 32.0,
                    width: 32.0,
                    color: Colors.grey,
                  ),
                  const Text('Indonesia'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),

        // Reviews
        const Text('Reviews',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
            )),

        const SizedBox(height: 16.0),
        Row(
          children: [
            const Text(
              '4,5',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                children: [
                  reviewBar(),
                  const SizedBox(height: 12.0),
                  reviewBar(),
                  const SizedBox(height: 12.0),
                  reviewBar(),
                  const SizedBox(height: 12.0),
                  reviewBar(),
                  const SizedBox(height: 12.0),
                  reviewBar(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row reviewBar() {
    return Row(
      children: [
        const Text('5'),
        const SizedBox(width: 6.0),
        SimpleAnimationProgressBar(
          height: 10.0,
          width: 250.0,
          backgroundColor: const Color(0x666EA8FE),
          foregrondColor: Colors.blue,
          ratio: 1/2,
          direction: Axis.horizontal,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ],
    );
  }
}
