import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        "Lupa Password".text.xl3.bold.make().pOnly(bottom: 20),

        TextField(
          decoration: const InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(),
          ),
        ),

        20.heightBox,

        ElevatedButton(
          onPressed: () {},
          child: "Kirim Reset Link".text.make(),
        ).wFull(context),

        10.heightBox,

        "Kembali ke Login".text.blue500.make().onTap(
          () => Navigator.pushReplacementNamed(context, '/login'),
        ),
      ]).p20().box.rounded.shadow.white.make().w(350).centered(),
    );
  }
}
