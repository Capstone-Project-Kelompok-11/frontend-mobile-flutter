// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/login_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';

class new_password extends StatefulWidget {
  const new_password({super.key});

  @override
  State<new_password> createState() => _new_passwordState();
}

class _new_passwordState extends State<new_password> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
        child: Column(
          children: [
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
                  textFormFieldWidget(
                      title: 'Create a new password',
                      hintText: '****',
                      suffixIcon: const Icon(Icons.lock)),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFormFieldWidget(
                      title: 'Confirm a new password',
                      hintText: '****',
                      suffixIcon: const Icon(Icons.lock)),
                ],
              ),
            ),
            const SizedBox(
              height: 167,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: InkWell(
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
                                    color: Colors.blue),
                                child: Center(
                                    child: Text(
                                  "Back to Login",
                                  style: whiteTextStyle,
                                )),
                              ),
                            ),
                          ],
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
                    "Continue",
                    style: whiteTextStyle,
                  )),
                ),
              ),
            ),
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
