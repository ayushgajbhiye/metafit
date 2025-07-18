import 'package:flutter/material.dart';

class DietSuggestionScreen extends StatefulWidget {
  final double bmi;
  final String category;

  const DietSuggestionScreen({
    super.key,
    required this.bmi,
    required this.category,
  });

  @override
  State<DietSuggestionScreen> createState() => _DietSuggestionScreenState();
}

class _DietSuggestionScreenState extends State<DietSuggestionScreen> {
  String? _foodPreference;

  final Map<String, Map<String, String>> dietPlans = {
    'Underweight_VEG': {
      'Meal': 'Paneer Bhurji, Peanut Butter Toast, Banana Shake',
      'Calories': 'Approx 2600 kcal',
      'Macros': 'Protein: 110g, Carbs: 300g, Fats: 100g',
    },
    'Underweight_NONVEG': {
      'Meal': 'Egg Bhurji, Chicken Curry with Rice, Milkshake',
      'Calories': 'Approx 2700 kcal',
      'Macros': 'Protein: 130g, Carbs: 280g, Fats: 90g',
    },
    'Normal_VEG': {
      'Meal': 'Mixed Veg Bowl, Daal-Roti, Fruits',
      'Calories': 'Approx 2200 kcal',
      'Macros': 'Protein: 90g, Carbs: 250g, Fats: 70g',
    },
    'Normal_NONVEG': {
      'Meal': 'Grilled Chicken, Rice, Eggs, Salad',
      'Calories': 'Approx 2300 kcal',
      'Macros': 'Protein: 110g, Carbs: 240g, Fats: 75g',
    },
    'Overweight_VEG': {
      'Meal': 'Oats, Daal, Stir-fried Veggies, Greek Yogurt',
      'Calories': 'Approx 1600 kcal',
      'Macros': 'Protein: 90g, Carbs: 140g, Fats: 50g',
    },
    'Overweight_NONVEG': {
      'Meal': 'Boiled Eggs, Grilled Chicken, Boiled Veggies',
      'Calories': 'Approx 1700 kcal',
      'Macros': 'Protein: 120g, Carbs: 130g, Fats: 60g',
    },
  };

  @override
  Widget build(BuildContext context) {
    String key = '';
    Map<String, String>? suggestion;

    if (_foodPreference != null) {
      key = '${widget.category}_${_foodPreference!}';
      suggestion = dietPlans[key];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Diet Suggestion'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your BMI: ${widget.bmi.toStringAsFixed(1)} (${widget.category})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose your food preference:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('Veg'),
                  selected: _foodPreference == 'VEG',
                  onSelected: (_) => setState(() => _foodPreference = 'VEG'),
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Non-Veg'),
                  selected: _foodPreference == 'NONVEG',
                  onSelected: (_) => setState(() => _foodPreference = 'NONVEG'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            if (_foodPreference != null && suggestion != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suggested Meals:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(suggestion['Meal']!),
                  const SizedBox(height: 12),
                  Text('Calories: ${suggestion['Calories']}'),
                  Text('Macros: ${suggestion['Macros']}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
