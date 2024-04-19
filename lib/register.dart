import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'login_screen.dart';
import 'colors.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // Digunakan untuk mengelola form
  bool _obscurePassword = true;

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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIK harus diisi';
        }
        return null;
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
    );
  }

  Widget buildRegisterButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.White,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // Validasi form sebelum melakukan aksi registrasi
        if (_formKey.currentState!.validate()) {
          // Tambahkan logika registrasi di sini
          print('Registrasi berhasil');
        }
      },
      child: Text('Daftar'),
    );
  }

  Widget buildLoginText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 0),
      child: RichText(
        text: TextSpan(
          text: 'Sudah punya akun? ',
          style: TextStyle(
            color: AppColors.Black,
            fontSize: 14,
          ),
          children: [
            TextSpan(
              text: 'Login',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 14,
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
