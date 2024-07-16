import 'package:flutter/material.dart';

class Login_Chat extends StatefulWidget {
  const Login_Chat({super.key});

  @override
  State<Login_Chat> createState() => _Login_ChatState();
}

class _Login_ChatState extends State<Login_Chat> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          children: [
            Icon(Icons.message, size: 80,
            ),
          ],
        ),
      )),
    );
  }
}