import 'package:flutter/material.dart';

class BMIResultPage extends StatelessWidget {
  final double bmi;
  final int age;
  final String gender;
  final double bmr;
  final double carbNeed;
  final double fatNeed;
  final double proteinNeed;

  BMIResultPage({
    required this.bmi,
    required this.age,
    required this.gender,
    required this.bmr,
    required this.carbNeed,
    required this.fatNeed,
    required this.proteinNeed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hasil BMI:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'BMI: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Informasi Tambahan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Usia: $age tahun',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Jenis Kelamin: $gender',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hasil perhitungan BMR berada di angka $bmr Kkal',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Kamu memerlukan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Kebutuhan Karbohidrat sebanyak ${carbNeed.toStringAsFixed(2)} gram',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Kebutuhan Lemak sebanyak ${fatNeed.toStringAsFixed(2)} gram',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'Kebutuhan Protein sebanyak ${proteinNeed.toStringAsFixed(2)} gram',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
