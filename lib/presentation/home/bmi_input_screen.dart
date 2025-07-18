import 'package:metafit/presentation/home/diet_suggestion_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<BmiInputScreen> createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;
  String? _category;

void _calculateBMI() {
  final height = double.tryParse(_heightController.text);
  final weight = double.tryParse(_weightController.text);

  if (height == null || weight == null || height <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter valid height and weight')),
    );
    return;
  }

  final heightInMeters = height / 100;
  final bmi = weight / pow(heightInMeters, 2);

  String category;
  if (bmi < 18.5) {
    category = 'Underweight';
  } else if (bmi < 25) {
    category = 'Normal';
  } else {
    category = 'Overweight';
  }

  setState(() {
    _bmi = bmi;
    _category = category;
  });

  // ✅ Navigate to DietSuggestionScreen
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DietSuggestionScreen(
        bmi: bmi,
        category: category,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            if (_bmi != null)
              Column(
                children: [
                  Text(
                    'Your BMI is: ${_bmi!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Category: $_category',
                    style: TextStyle(
                      fontSize: 16,
                      color: _category == 'Normal'
                          ? Colors.green
                          : (_category == 'Underweight' ? Colors.orange : Colors.red),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
