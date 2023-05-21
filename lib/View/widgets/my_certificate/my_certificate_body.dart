import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class MyCertificateBody extends StatelessWidget {
  const MyCertificateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          height: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 74,
                  width: 74,
                  child:
                      Image.asset('assets/images/img_basic_microsoft_word.png'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10, left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 104,
                            child: Text(
                              'Basic Microsoft Word',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: 104,
                            child: index % 2 == 0
                                ? Text(
                                    'Completed',
                                    style: greenTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.end,
                                  )
                                : Text(
                                    'Not Complete',
                                    style: redTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue),
                          child: Center(
                            child: Text(
                              'See Certificate',
                              style: whiteTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
