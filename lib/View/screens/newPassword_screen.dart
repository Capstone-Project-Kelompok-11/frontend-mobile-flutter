// ignore: file_names
// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/provider/newPassword_provider.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';
import 'package:provider/provider.dart';

class newPassword extends StatefulWidget {
  const newPassword({super.key});

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
  @override
  Widget build(BuildContext context) {
    newPasswordProvider NewPasswordProvider =
        Provider.of<newPasswordProvider>(context);
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
                    onChanged: (value) {
                      NewPasswordProvider.validatePassword(value);
                    },
                    isObsucreText: NewPasswordProvider.isHidePassword,
                    isValidTextField: NewPasswordProvider.isPasswordValid,
                    errorMessage: NewPasswordProvider.errorPasswordMessage,
                    hintText: 'Password',
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        NewPasswordProvider.showHidePassword();
                      },
                      icon: NewPasswordProvider.isHidePassword
                          ? const Icon(Icons.lock)
                          : const Icon(
                              Icons.lock_open,
                            ),
                    ),
                  ),
                  Text(
                    'Confirm a new password',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                  ),
                  textFieldWidget(
                    onChanged: (value) {
                      NewPasswordProvider.validateConfirmPassword(value);
                    },
                    isObsucreText: NewPasswordProvider.isHideConfirmPassword,
                    isValidTextField:
                        NewPasswordProvider.isConfirmPasswordValid,
                    errorMessage:
                        NewPasswordProvider.errorConfirmPasswordMessage,
                    hintText: 'Confirm Password',
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        NewPasswordProvider.showHideConfirmPassword();
                      },
                      icon: NewPasswordProvider.isHideConfirmPassword
                          ? const Icon(Icons.lock)
                          : const Icon(
                              Icons.lock_open,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 167,
            ),
            buttonWidget(
              onTap: NewPasswordProvider.disableButtonNewPassowrd()
                  ? () {
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
                                          builder: (context) =>
                                              const login_screen(),
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
                    }
                  : null,
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
