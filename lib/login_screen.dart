import 'dart:convert'; // Impor untuk menggunakan jsonEncode

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:latihanflutter/home_page.dart';
import 'register.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    final url = Uri.parse('http://127.0.0.1:8000/login'); // Ganti dengan URL login Anda
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Jika login berhasil
      final responseData = json.decode(response.body);
      final int userId = responseData['user_id'];
      final String accessToken = responseData['access_token'];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(userId: userId, token: accessToken)
        ),
      );
    } else {
      // Jika login gagal
      print('Failed to login: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: buildLoginForm(),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.White.withOpacity(0.5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLoginHeader(),
          SizedBox(height: 30),
          buildUsernameField(),
          SizedBox(height: 20),
          buildPasswordField(),
          SizedBox(height: 30),
          buildLoginButton(),
          buildRegisterText(),
        ],
      ),
    );
  }

  Widget buildLoginHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30, top: 30),
      child: Text(
        'Login',
        style: TextStyle(
          color: AppColors.Black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildUsernameField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: _usernameController,
        decoration: InputDecoration(
          hintText: 'Username',
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          hintText: 'Password',
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
              width: 1,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue,
              width: 1,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: AppColors.Black,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.White,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        loginUser();
      },
      child: Text('Login'),
    );
  }

  Widget buildRegisterText() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      child: RichText(
        text: TextSpan(
          text: 'Belum Punya Akun? ',
          style: TextStyle(
            color: AppColors.Black,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'Daftar',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 14,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
