// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/otp_screen.dart';
import 'package:lms_apps/View/screens/theme/theme.dart';
import 'package:lms_apps/ViewModels/forgot_password_view_model.dart';
import 'package:provider/provider.dart';

import '../register/buttonWidget.dart';
import 'forgot_password_widget.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({super.key});

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  String sendOTP = '';
  @override
  Widget build(BuildContext context) {
    ForgotPasswordProvider forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context);
    EmailOTP myauth = EmailOTP();

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 257, left: 30, right: 30),
        child: Column(
          children: [
            Text(
              'Forgot Password',
              style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Enter your Email, address to get an OTP code to reset you password.',
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
                      onChanged: (value) {
                        forgotPasswordProvider.validateEmail(value);
                      },
                      controller: forgotPasswordProvider.emailController,
                      title: 'Email',
                      hintText: 'Capstone11@gmail.com',
                      errorMessage: forgotPasswordProvider.errorEmailMessage,
                      isValidTextField: forgotPasswordProvider.isEmailValid),
                ],
              ),
            ),
            const SizedBox(
              height: 251,
            ),
            buttonWidget(
              onTap: () async {
                myauth.setConfig(
                    appEmail: "Alterra@AcadeMade.com",
                    appName: "AcadeMade",
                    userEmail: forgotPasswordProvider.email,
                    otpLength: 4,
                    otpType: OTPType.digitsOnly);
                if (await myauth.sendOTP() == true) {
                  // Memperbarui sentOTP dengan nilai OTP yang dikirim
                  print('OTP sent to email: $sendOTP');
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("OTP has been sent"),
                  ));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OTPScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Oops, OTP send failed'),
                  ));
                }
              },
              isIcon: true,
              title: 'Continue',
              color: blueColor,
              textColor:
                  whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            ),
          ],
        ),
      ),
    );
  }
}
