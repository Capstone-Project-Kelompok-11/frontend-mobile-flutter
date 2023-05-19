import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/home_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

// ignore: camel_case_types
class registration_screen extends StatefulWidget {
  const registration_screen({super.key});

  @override
  State<registration_screen> createState() => _registration_screenState();
}

// ignore: camel_case_types
class _registration_screenState extends State<registration_screen> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              top: 121, bottom: 39.5, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontSize: 24.88,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Image.asset(
                    'assets/icon/hello.png',
                    width: 32.08,
                    height: 32.08,
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fullname',
                            style: GoogleFonts.poppins(
                                fontSize: 17.28, fontWeight: FontWeight.w400),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Input Fullname',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fullname',
                            style: GoogleFonts.poppins(
                                fontSize: 17.28, fontWeight: FontWeight.w400),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your name',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fullname',
                            style: GoogleFonts.poppins(
                                fontSize: 17.28, fontWeight: FontWeight.w400),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Input Fullname',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    buttonWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      title: 'Register',
                      textColor: whiteTextStyle.copyWith(fontSize: 14.4),
                    ),
                    buttonWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      title: 'Sign In',
                      textColor: whiteTextStyle.copyWith(fontSize: 14.4),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWidget({
    required Function()? onTap,
    required String title,
    Color color = Colors.blue,
    required TextStyle textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 34,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue),
            color: color,
          ),
          child: Center(
            child: Text(
              title,
              style: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
