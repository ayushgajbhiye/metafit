import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.boy_rounded, color: Colors.redAccent,),
            Text(title),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(),
            TextField(
              obscureText: true,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 20,),
              Expanded(child: Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}
