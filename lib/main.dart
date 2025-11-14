import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'auth/login.dart';
import 'auth/register.dart';
import 'auth/forgotpassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot': (context) => const ForgotPasswordPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    // Animasi Fade
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    // Auto pindah ke login
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        FadeTransition(
          opacity: _fade,
          child: Image.asset(
            "assets/logo.png",
            width: 140,
            height: 140,
          ).centered(),
        ),
        20.heightBox,
        "Loading...".text.gray500.make().p4(),
      ]).centered(),
    );
  }
}
