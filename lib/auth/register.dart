import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        "Register".text.xl3.bold.make().pOnly(bottom: 20),

        TextField(
          decoration: const InputDecoration(
            labelText: "Nama",
            border: OutlineInputBorder(),
          ),
        ),
        15.heightBox,

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
          child: "Daftar".text.make(),
        ).wFull(context),

        10.heightBox,

        HStack([
          "Sudah punya akun?".text.make(),
          5.widthBox,
          "Login".text.blue500.make().onTap(() {
            Navigator.pushReplacementNamed(context, '/login');
          }),
        ]).centered(),
      ]).p20().box.rounded.shadow.white.make().w(350).centered(),
    );
  }
}
