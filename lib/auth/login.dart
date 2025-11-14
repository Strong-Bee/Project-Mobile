import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        "Login".text.xl3.bold.make().pOnly(bottom: 20),

        TextField(
          decoration: const InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
          ),
        ),
        15.heightBox,
        TextField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(),
          ),
        ),

        20.heightBox,

        ElevatedButton(
          onPressed: () {},
          child: "Login".text.make(),
        ).wFull(context),

        10.heightBox,

        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/forgot');
          },
          child: "Lupa Password?".text.make(),
        ),

        10.heightBox,

        HStack([
          "Belum punya akun?".text.make(),
          5.widthBox,
          "Register".text.blue500.make().onTap(
            () => Navigator.pushNamed(context, '/register'),
          ),
        ]).centered(),
      ]).p20().box.rounded.shadow.white.make().w(350).centered(),
    );
  }
}
