// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';

// ignore: camel_case_types
class newPassword extends StatefulWidget {
  const newPassword({super.key});

  @override
  State<newPassword> createState() => _newPasswordState();
}

// ignore: camel_case_types
class _newPasswordState extends State<newPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
          child: Column(children: [
            Text(
              'Create new Password',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Save the new password in a safe place, If you forget it then you have to do a forgot paswword again',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create a new password',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                  ),
                  textFieldWidget(
                    hintText: 'Enter your new password',
                    keyboardType: TextInputType.emailAddress,
                    isObsucreText: false,
                    textColor: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: small),
                  ),
                  Text(
                    'Confirm a new password',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                  ),
                  textFieldWidget(
                      hintText: 'Confirm new password',
                      keyboardType: TextInputType.emailAddress,
                      isObsucreText: false,
                      textColor: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: small)),
                ],
              ),
            ),
            const SizedBox(
              height: 167,
            ),
            buttonWidget(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.white,
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          size: 92.44,
                        ),
                        title: Text(
                          'Welcome Back!',
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: bold),
                        ),
                        content: Text(
                          'You have succesfully reset and created a new password',
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: small),
                          textAlign: TextAlign.center,
                        ),
                        actions: <Widget>[
                          buttonWidget(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const login_screen(),
                                  ),
                                );
                              },
                              title: 'Go To Home',
                              color: blueColor,
                              textColor: whiteTextStyle)
                        ],
                      ),
                    );
                  },
                );
              },
              title: 'Continue',
              color: blueColor,
              textColor:
                  whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            )
          ]),
        ),
      ),
    );
  }
}
