import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../Services/constant.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Kirim permintaan penggantian password ke server
      try {
        Response response = await Dio().post(
          '${APIConstant.url}/users/change/password',
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );

        // Periksa kode status dari respons server
        if (response.statusCode == 200) {
          // Password berhasil diganti, lakukan tindakan yang sesuai
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Password Reset'),
              content: Text('Password berhasil diubah.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        } else {
          // Ada kesalahan dalam permintaan penggantian password
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Password Reset'),
              content: Text('Gagal mengganti password. Silakan coba lagi.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
      } catch (error) {
        // Terjadi kesalahan dalam koneksi atau pemrosesan data
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Error'),
            content: Text('Terjadi kesalahan. Silakan coba lagi.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  // Tambahkan validasi tambahan sesuai kebutuhan (misal: minimal karakter, kekuatan password, dll)
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password Baru',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  }
                  if (value != passwordController.text) {
                    return 'Konfirmasi password tidak sesuai';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _resetPassword,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
