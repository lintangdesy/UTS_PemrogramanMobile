import 'package:flutter/material.dart';
import 'bmi_result.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String gender = 'Male'; // Default gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: gender,
              onChanged: (String? value) {
                setState(() {
                  gender = value!;
                });
              },
              items: <String>['Male', 'Female'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Berat Badan (kg)',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text(
              'Tinggi Badan (cm)',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text(
              'Usia',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi untuk menghitung BMI dan menavigasi ke halaman hasil
                _calculateBMI(context);
              },
              child: Text('Lihat Hasil'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBMI(BuildContext context) {
    // Lakukan perhitungan BMI di sini
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    int age = int.tryParse(ageController.text) ?? 0;

    // Validasi input (misalnya, pastikan berat dan tinggi tidak nol)
    if (weight > 0 && height > 0) {
      // Hitung BMI
      double bmi = weight / ((height / 100) * (height / 100));

      // Hitung BMR (Basa Metabolic Rate)
      double bmr = _calculateBMR(weight, height, age, gender);

      // Hitung kebutuhan nutrisi
      double carbNeed = _calculateNutrientNeed(bmr, NutrientType.Carbohydrate);
      double fatNeed = _calculateNutrientNeed(bmr, NutrientType.Fat);
      double proteinNeed = _calculateNutrientNeed(bmr, NutrientType.Protein);

      // Tampilkan hasil BMR dan kebutuhan nutrisi di console
      print('Hasil perhitungan BMR berada di angka $bmr Kkal');
      print('Kamu memerlukan:');
      print('Kebutuhan Karbohidrat sebanyak $carbNeed gram');
      print('Kebutuhan Lemak sebanyak $fatNeed gram');
      print('Kebutuhan Protein sebanyak $proteinNeed gram');

      // Navigasi ke halaman hasil dengan membawa hasil BMI dan informasi nutrisi
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BMIResultPage(
            bmi: bmi,
            age: age,
            gender: gender,
            bmr: bmr,
            carbNeed: carbNeed,
            fatNeed: fatNeed,
            proteinNeed: proteinNeed,
          ),
        ),
      );
    } else {
      // Tampilkan pesan kesalahan jika input tidak valid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Mohon isi berat badan dan tinggi badan dengan benar.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  double _calculateBMR(double weight, double height, int age, String gender) {
    // Rumus Harris-Benedict untuk menghitung BMR
    if (gender == 'Male') {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
  }

  double _calculateNutrientNeed(double bmr, NutrientType nutrientType) {
    // Konversi BMR ke kebutuhan nutrisi harian
    // Angka ini dapat disesuaikan sesuai dengan kebutuhan nutrisi yang diinginkan
    double nutrientMultiplier;
    switch (nutrientType) {
      case NutrientType.Carbohydrate:
        nutrientMultiplier = 55.0;
        break;
      case NutrientType.Fat:
        nutrientMultiplier = 30.0;
        break;
      case NutrientType.Protein:
        nutrientMultiplier = 15.0;
        break;
    }
    return (nutrientMultiplier / 100) * bmr / 4; // Kebutuhan nutrisi dihitung dalam gram
  }
}

enum NutrientType { Carbohydrate, Fat, Protein }
