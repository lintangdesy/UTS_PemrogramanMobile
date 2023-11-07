import 'package:flutter/material.dart';
import 'package:uts/register.dart';
import 'welcome.dart'; // Import file welcome.dart

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika login di sini
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Contoh sederhana, Anda harus melakukan validasi sesuai kebutuhan aplikasi Anda
                if (username == 'user' && password == 'password') {
                  // Jika login berhasil, navigasikan ke halaman welcome
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(username: username),
                    ),
                  );
                } else {
                  // Jika login gagal, tampilkan pesan kesalahan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login gagal. Periksa kembali username dan password Anda.'),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman pendaftaran
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text('Belum punya akun? Daftar di sini'),
            ),
          ],
        ),
      ),
    );
  }
}
