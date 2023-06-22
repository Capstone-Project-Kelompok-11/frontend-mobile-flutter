import 'package:flutter/material.dart';
import 'package:lms_apps/ViewModels/final_task_view_model.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:provider/provider.dart';

class FinalBody extends StatefulWidget {
  final String? fileID;
  const FinalBody({super.key, this.fileID});

  @override
  State<FinalBody> createState() => _FinalBodyState();
}

class _FinalBodyState extends State<FinalBody> {
  @override
  void initState() {
    // Provider.of<FinalTaskViewModel>(context, listen: false)
    //     .uploadFile("546c320fd3284e948fc96a78130cb740", context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final finalTaskViewModel = Provider.of<FinalTaskViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
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
          ListView.builder(
            clipBehavior: Clip.none,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: finalTaskViewModel.data.length,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ',
                    style: const TextStyle(height: 1.65),
                  ),
                  Expanded(
                    child: Text(
                      finalTaskViewModel.data[index],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(height: 1.65),
                    ),
                    // flex: 6,
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '1. Kumpulkan dalam format PDF',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 12,
              color: blackColor,
            ),
          ),
          Text(
            '2. Berikan link pengerjaan di dalam pdf tersebut',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 12,
              color: blackColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              finalTaskViewModel.uploadFile("9a215293cf144266873351b0264f6277", context);
              print('ERROR 5 ${widget.fileID}');
            },
            child: Container(
              color: const Color(0xFFEFEFEF),
              height: 159,
              // width: 332,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: 45,
                          color: const Color(0xff262626).withOpacity(0.4),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Uploud File",
                          style: blackTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: const Color(0xFF262626).withOpacity(0.4),
                            // color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
