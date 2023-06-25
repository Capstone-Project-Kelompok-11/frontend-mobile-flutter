// ignore_for_file: camel_case_types

import 'dart:async';

// import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/new_password_screen.dart';
// import 'package:lms_apps/View/screens/new_OTP_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
// import 'package:lms_apps/ViewModels/forgot_password_view_model.dart';
import 'package:lms_apps/ViewModels/otp_view_model.dart';
import 'package:provider/provider.dart';
// import 'buttonWidget.dart';
import 'forgot_password_widget.dart';

class otp_screen extends StatefulWidget {
  const otp_screen({super.key});

  @override
  State<otp_screen> createState() => _otp_screenState();
}

class _otp_screenState extends State<otp_screen> {
  Timer? _timer;
  int _secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_secondsRemaining < 1) {
          timer.cancel();
          // Tindakan yang ingin Anda lakukan setelah timer berakhir
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  void resendCode() {
    // Perform the action to resend the code here
    // Reset the timer and update the remaining seconds
    setState(() {
      _secondsRemaining = 60;
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OTPProvider otpProvider = Provider.of<OTPProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
        child: Column(
          children: [
            Text(
              "You've got mail",
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'We have sent the OTP verification code to your email address, Check your email and enter the code below.',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFormFieldWidget(
                      onChanged: (value) {
                        otpProvider.validateOTP(value);
                      },
                      isObsucreText: otpProvider.isHideOTP,
                      isValidTextField: otpProvider.isOTPValid,
                      errorMessage: otpProvider.errorOTPMessage,
                      hintText: 'Code OTP',
                      controller: otpProvider.otpController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          otpProvider.showHideOTP();
                        },
                        icon: otpProvider.isHideOTP
                            ? const Icon(Icons.lock)
                            : const Icon(
                                Icons.lock_open,
                              ),
                      ),
                      title: 'OTP CODE',
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Didn't receive email?",
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: small),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You can resend code in $_secondsRemaining s",
                      style: blackTextStyle.copyWith(
                          fontSize: 12, fontWeight: small),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: _secondsRemaining > 0 ? null : resendCode,
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: small,
                          color:
                              _secondsRemaining > 0 ? Colors.grey : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            // buttonWidget(
            //   onTap: () async {
            //     print(otpProvider.otpController.text);
            //     if (await myauth.verifyOTP(
            //             otp: otpProvider.otpController.text) ==
            //         true) {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text("OTP is verified"),
            //       ));
            //     } else {
            //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //         content: Text("Invalid OTP"),
            //       ));
            //     }
            //   },
            //   title: 'Confirm',
            //   color: blueColor,
            //   textColor:
            //       whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            // )
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewPassword(),
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
                  "Continue",
                  style: blueTextStyle,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
