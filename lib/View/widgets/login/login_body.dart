import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 121, left: 30, right: 30),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                'Hello there',
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
                      textFormFieldWidget(
                        title: 'Email',
                        hintText: 'Enter your email',
                      )
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
                          suffixIcon: const Icon(Icons.lock)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                            setState(() {
                              _isChecked = !_isChecked;
                            });
                          },
                          child: Text('Remember me', style: blackTextStyle),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 56),
          Center(
            child: TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const forgotPassword(),
                //   ),
                // );
              },
              child: Text('Forgot Password',
                  style: blackTextStyle.copyWith(
                      fontSize: 17.27, fontWeight: bold)),
            ),
          ),
          const SizedBox(height: 150),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue),
                    child: Center(
                        child: Text(
                      "Sign In",
                      style: whiteTextStyle,
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: blueColor)),
                  child: Center(
                      child: Text(
                    "Didn't have an account? Sign Up",
                    style: blueTextStyle,
                  )),
                ),
              ),
            ],
          ),
        ]),
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
