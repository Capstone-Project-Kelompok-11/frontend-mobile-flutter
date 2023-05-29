import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/widgets/login/login_body.dart';

class registration_screen extends StatefulWidget {
  const registration_screen({super.key});

  @override
  State<registration_screen> createState() => _registration_screenState();
}

class _registration_screenState extends State<registration_screen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 121, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Image.asset(
                  'assets/icon/hello.png',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFormFieldWidget(
                                hintText: 'Fullname', title: 'Fullname'),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFormFieldWidget(
                              title: 'Email',
                              hintText: 'Capstone11@gmail.com',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFormFieldWidget(
                              title: 'Password',
                              hintText: '*****',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFormFieldWidget(
                              title: 'Confirm Password',
                              hintText: '******',
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.lock)),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      _isChecked = !_isChecked;
                                    },
                                  );
                                },
                                child: Text(
                                  'Remember me',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 12, fontWeight: small),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Terms and Service',
                            style: blackTextStyle.copyWith(
                                fontSize: 12, fontWeight: small),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                Future.delayed(
                                  const Duration(seconds: 2),
                                  () {
                                    Navigator.of(context)
                                        .pop(); // Tutup dialog setelah 2 detik
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  },
                                );
                                return SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: AlertDialog(
                                    contentPadding:
                                        const EdgeInsets.only(right: 39),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: Colors.white,
                                    icon: const Icon(
                                      Icons.check_circle_rounded,
                                      size: 92.44,
                                    ),
                                    title: Text(
                                      'Successful!',
                                      textAlign: TextAlign.center,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 18, fontWeight: bold),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 34,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue),
                            child: Center(
                                child: Text(
                              'Sign Up',
                              style: whiteTextStyle,
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: blueColor)),
                          child: Center(
                              child: Text(
                            'Already have an account, Sign In',
                            style: blueTextStyle,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textFormFieldWidget({
    required String title,
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.only(left: 16),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
