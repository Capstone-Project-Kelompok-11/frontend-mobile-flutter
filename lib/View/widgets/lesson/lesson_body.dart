import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class LessonsBody extends StatelessWidget {
  const LessonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> datalesson = [
      'Keterbacaan: Desain antarmuka pengguna harus mudah dibaca dan dipahami oleh pengguna. Ini meliputi penggunaan font yang jelas dan mudah dibaca, tata letak yang jelas dan terorganisir, serta warna yang mudah dibaca dan kontras.',
      'Navigasi yang mudah: Antarmuka pengguna harus memiliki navigasi yang mudah dipahami dan dapat membantu pengguna mencapai tujuan mereka dengan cepat dan efisien.' ,
      'Konsistensi: Desain antarmuka pengguna harus konsisten dalam seluruh produk digital. Ini termasuk konsistensi dalam tata letak, warna, font, dan interaksi pengguna.' ,
      'Estetika visual: Antarmuka pengguna harus menarik secara visual dan menunjukkan identitas merek yang jelas. Ini dapat dicapai melalui penggunaan warna, gambar, dan ilustrasi yang menarik.' ,
      'Responsivitas: Desain antarmuka pengguna harus responsif dan dapat menyesuaikan dengan berbagai ukuran layar, baik di desktop maupun di perangkat mobile.'
    ];
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: datalesson.length,
                itemBuilder: (context , index){
                return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ',
                    style: const TextStyle(height: 1.65),
                  ),
                  Expanded(
                    child: Text(
                      '${datalesson[index]}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(height: 1.65),
                    ),
                    // flex: 6,
                  ),
                ],
              );
              },),
              SizedBox(height: 60,)
            ],
          ),
        ],
      ),
    );
  }
}
