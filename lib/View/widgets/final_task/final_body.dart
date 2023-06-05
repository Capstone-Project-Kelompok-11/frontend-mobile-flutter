import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class FinalBody extends StatelessWidget {
  const FinalBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      'Pilih Topik Aplikasi: Pilihlah topik aplikasi yang menarik dan relevan. Anda dapat memilih topik seperti aplikasi perjalanan, aplikasi kesehatan, aplikasi keuangan, atau topik lain sesuai minat Anda.',
      'Rancang Wireframe: Buat wireframe untuk antarmuka aplikasi Anda. Tentukan tata letak halaman, penempatan elemen-elemen penting, dan alur navigasi yang intuitif.',
      'Desain Visual: Berdasarkan wireframe, buat desain visual yang menarik dan sesuai dengan tema aplikasi Anda. Pertimbangkan pemilihan warna, tipografi, ikon, dan elemen grafis lainnya untuk menciptakan tampilan yang konsisten dan menarik.'
    ];
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
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // return ListTile(
              //   dense: true,
              //   leading: Text('${index + 1}. '),
              //   minLeadingWidth: 0,
              //   minVerticalPadding: 0,
              //   // horizontalTitleGap: 5.0,
              //   contentPadding: EdgeInsets.zero,
              //   title: Text('${data[index]} '),
              // );
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. ',
                    style: const TextStyle(height: 1.65),
                  ),
                  Expanded(
                    child: Text(
                      '${data[index]}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(height: 1.65),
                    ),
                    // flex: 6,
                  ),
                ],
              );
            },
            itemCount: data.length,
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
              color: Colors.black,
            ),
          ),
          Text(
            '2. Berikan link pengerjaan di dalam pdf tersebut',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              _pickFile();
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

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    // OpenFile.open(file.path, file);
    OpenFile.open(file.path!);
  }
}
