import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metafit/presentation/auth/login_screen.dart';

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({Key? key}) : super(key: key);

  @override
  _BmiInputScreenState createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = "";

  void _calculateBMI() {
    final double height = double.tryParse(_heightController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0;
    if (height <= 0 || weight <= 0) {
      setState(() {
        _bmiResult = "Please enter valid values";
      });
      return;
    }

    final double bmi = weight / ((height / 100) * (height / 100));
    setState(() {
      _bmiResult = "Your BMI is ${bmi.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 16),
            Text(
              _bmiResult,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
