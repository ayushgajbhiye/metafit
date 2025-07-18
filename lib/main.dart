// External packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Local project files
import 'package:metafit/presentation/auth/login_screen.dart';
import 'package:metafit/presentation/auth/sign_up_screen.dart';
import 'package:metafit/presentation/home/bmi_input_screen.dart';
import 'package:metafit/presentation/welcome/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meta Fit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(title: 'metafit',),
        '/bmi': (context) => const BmiInputScreen(),
      },
    );
  }
}
