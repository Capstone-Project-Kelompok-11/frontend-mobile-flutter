import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class LessonsBody extends StatelessWidget {
  const LessonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset('assets/images/Rectangle 26.png'),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                'Pengenalan tentang Desain Antarmuka Pengguna (UI Design)',
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 14.4, color: Colors.black),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Pengantar:',
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 14.4, color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Desain antarmuka pengguna (UI design) adalah bagian penting dari pengembangan produk digital yang efektif. UI design melibatkan merancang antarmuka pengguna yang mudah digunakan dan menarik, serta memperhatikan aspek-aspek seperti navigasi, tata letak, interaksi, dan estetika visual. Kursus ini akan memberikan pengantar tentang UI design dan membahas prinsip-prinsip desain antarmuka pengguna yang baik.',
                style: blackTextStyle.copyWith(
                    fontWeight: regular, fontSize: 12, color: Colors.black),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Prinsip-prinsip desain antarmuka pengguna:',
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 14, color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  'Keterbacaan: Desain antarmuka pengguna harus mudah dibaca dan dipahami oleh pengguna. Ini meliputi penggunaan font yang jelas dan mudah dibaca, tata letak yang jelas dan terorganisir, serta warna yang mudah dibaca dan kontras'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8,top: 2),
                    decoration: const BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 34,
                    width: 170,
                    child: Text(
                      'Score : 0',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 17.28,
                          color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Take Quiz',
                      style: whiteTextStyle.copyWith(
                          fontWeight: regular, fontSize: 14.4),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
