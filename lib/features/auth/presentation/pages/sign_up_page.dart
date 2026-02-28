import 'package:flutter/material.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/base_app_bar.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_button.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: BaseAppBar(),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.create, size: 80, color: colorScheme.inversePrimary),
              Text('C A D A S T R O', style: TextStyle(fontSize: 20)),
              SizedBox.shrink(),
              BaseInput(hintText: 'Nome'),
              BaseInput(hintText: 'E-mail'),
              BaseInput(hintText: 'Senha', obscureText: true),
              BaseInput(hintText: 'Repita a senha', obscureText: true),

              BaseButton(title: 'Cadastrar', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
