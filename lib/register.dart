import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'login_screen.dart';
import 'colors.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // Digunakan untuk mengelola form
  bool _obscurePassword = true;
  String _name = '';
  String _nik = '';
  String _email = '';
  String _phoneNumber = '';
  String _username = '';
  String _password = '';

  Future<void> registerUser() async {
    final url = Uri.parse('http://127.0.0.1:8000/users/'); // Ganti dengan URL API Anda

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': _username,
        'password': _password,
        'fullname': _name,
        'nik': _nik,
        'email': _email,
        'telphone': _phoneNumber,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Berhasil
      print('User registered successfully');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sukses"),
            content: Text("Anda telah berhasil mendaftar"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Gagal
      print('Failed to register user: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register: ${response.body}')),
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
            child: buildRegisterForm(),
          ),
        ),
      ),
    );
  }

  Widget buildRegisterForm() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.White.withOpacity(0.5),
      ),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRegisterHeader(),
            SizedBox(height: 20),
            buildNameField(),
            SizedBox(height: 20),
            buildNIKField(),
            SizedBox(height: 20),
            buildEmailField(),
            SizedBox(height: 20),
            buildNoTlpField(),
            SizedBox(height: 20),
            buildUsernameField(),
            SizedBox(height: 20),
            buildPasswordField(),
            SizedBox(height: 30),
            buildRegisterButton(),
            buildLoginText(context),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0, top: 0),
      child: Text(
        'Daftar',
        style: TextStyle(
          color: AppColors.Black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Nama Lengkap',
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama lengkap harus diisi';
        }
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget buildNIKField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'NIK',
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
      keyboardType: TextInputType.number, // Hanya menerima input angka
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIK harus diisi';
        }
        return null;
      },
      onSaved: (value) {
        _nik = value!;
      },
    );
  }
  
  Widget buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email harus diisi';
        }
        // Logika validasi email
        final emailRegex = RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b', caseSensitive: false);
        if (!emailRegex.hasMatch(value)) {
          return 'Format email tidak valid';
        }
        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget buildNoTlpField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Nomer Telphone',
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nomer telphone harus diisi';
        }
        return null;
      },
      onSaved: (value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget buildUsernameField() {
    return TextFormField(
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username harus diisi';
        }
        return null;
      },
      onSaved: (value) {
        _username = value!;
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password harus diisi';
        }
        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget buildRegisterButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.White,
        minimumSize: Size(double.infinity, 50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          _formKey.currentState?.save();
          registerUser();
        }
      },
      child: Text('Daftar'),
    );
  }

  Widget buildLoginText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: RichText(
        text: TextSpan(
          text: 'Sudah punya akun? ',
          style: TextStyle(
            color: AppColors.Black,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'Masuk',
              style: TextStyle(
                color: AppColors.accentColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
