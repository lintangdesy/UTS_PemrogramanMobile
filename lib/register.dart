import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
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
                // Implementasi logika pendaftaran di sini
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Contoh sederhana, Anda harus melakukan validasi dan penyimpanan sesuai kebutuhan aplikasi Anda
                if (username.isNotEmpty && password.isNotEmpty) {
                  // Simpan informasi pendaftaran atau lakukan tindakan yang sesuai
                  // Misalnya, simpan ke database atau lakukan pendaftaran pengguna
                  // Setelah pendaftaran berhasil, Anda bisa langsung login atau kembali ke halaman login
                  Navigator.pop(context); // Kembali ke halaman login setelah pendaftaran berhasil
                } else {
                  // Jika pendaftaran gagal, tampilkan pesan kesalahan
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Isi semua kolom dengan benar.'),
                    ),
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
