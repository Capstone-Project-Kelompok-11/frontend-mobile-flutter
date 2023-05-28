// ignore: file_names
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:lms_apps/View/screens/newPassword_screen.dart';
import 'package:lms_apps/View/screens/provider/otp_provider.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/View/screens/widget/textFieldWidget.dart';
import 'widget/buttonWidget.dart';
import 'package:provider/provider.dart';
import 'package:email_otp/email_otp.dart';

// ignore: camel_case_types
class OTPscreen extends StatefulWidget {
  const OTPscreen({super.key});

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

// ignore: camel_case_types
class _OTPscreenState extends State<OTPscreen> {
  @override
  Widget build(BuildContext context) {
    OTPProvider otpProvider = Provider.of<OTPProvider>(context);
    EmailOTP myauth = EmailOTP();
    return Scaffold(
      body: SingleChildScrollView(
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
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Code OTP',
                      style:
                          GoogleFonts.poppins(fontSize: 16, fontWeight: small),
                    ),
                    textFieldWidget(
                      onChanged: (value) {
                        otpProvider.validatePassword(value);
                      },
                      isObsucreText: otpProvider.isHidePassword,
                      isValidTextField: otpProvider.isPasswordValid,
                      errorMessage: otpProvider.errorPasswordMessage,
                      hintText: 'Code OTP',
                      suffixIconWidget: IconButton(
                        onPressed: () {
                          otpProvider.showHidePassword();
                        },
                        icon: otpProvider.isHidePassword
                            ? const Icon(Icons.lock)
                            : const Icon(
                                Icons.lock_open,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Didn't receive email?",
                style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
              ),
              Text(
                "You can resend code in 60 s",
                style: blackTextStyle.copyWith(fontSize: 12, fontWeight: small),
              ),
              const SizedBox(
                height: 27,
              ),
              buttonWidget(
                  onTap: () async {
                    print(otpProvider.password);
                    if (await myauth.verifyOTP(otp: otpProvider.password) ==
                        true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("OTP is verified"),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Invalid OTP"),
                      ));
                    }
                  },
                  title: 'Confirm',
                  color: blueColor,
                  textColor: whiteTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular))
            ],
          ),
        ),
      ),
    );
  }
}
