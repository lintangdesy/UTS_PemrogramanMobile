import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

class WelcomePage extends StatelessWidget {
  final String username;

  WelcomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Selamat Datang, $username!',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari informasi Gizi',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            _buildList(
              context: context,
              title: 'Index Masa Tubuh',
              subtitle: 'Ketahui status gizimu melalui perbandingan berat dan tinggi badan.',
              color: Colors.blue,
              buttonColor: Colors.white,
              buttonTextColor: Colors.blue,
              subtitleColor: Colors.yellow,
            ),
            SizedBox(height: 16.0),
            _buildList(
              context: context,
              title: 'Energi Basal',
              subtitle: 'Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk menjalankan fungsi fisiologis tubuh.',
              buttonLabel: 'Cek Sekarang',
              color: Colors.red,
              buttonColor: Colors.white,
              buttonTextColor: Colors.red,
              subtitleColor: Colors.yellow,
            ),
            SizedBox(height: 16.0),
            _buildList(
              context: context,
              title: 'Energi Expenditure',
              subtitle: 'Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk mempertahankan kehidupan.',
              buttonLabel: 'Cek Sekarang',
              color: Colors.green,
              buttonColor: Colors.white,
              buttonTextColor: Colors.green,
              subtitleColor: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList({
    required BuildContext context,
    required String title,
    required String subtitle,
    String buttonLabel = 'Cek Sekarang',
    required Color color,
    required Color buttonColor,
    required Color buttonTextColor,
    required Color subtitleColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMICalculator(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: Text(
              buttonLabel,
              style: TextStyle(
                color: buttonTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}