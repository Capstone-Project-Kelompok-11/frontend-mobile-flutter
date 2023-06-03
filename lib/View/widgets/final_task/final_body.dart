import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class FinalBody extends StatelessWidget {
  const FinalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tugas akhir ini bertujuan untuk menguji dan menerapkan pengetahuan dan keterampilan UI Design yang telah Anda pelajari selama kursus ini. Anda akan merancang antarmuka pengguna (UI) untuk sebuah aplikasi mobile berdasarkan topik pilihan Anda.',
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Langkah-langkah yang harus dilakukan:',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 14.4,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
