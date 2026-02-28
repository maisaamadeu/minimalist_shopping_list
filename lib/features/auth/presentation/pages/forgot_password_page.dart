import 'package:flutter/material.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/base_app_bar.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_button.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_input.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
              Icon(
                Icons.password_rounded,
                size: 80,
                color: colorScheme.inversePrimary,
              ),
              Text(
                'R E C U P E R A Ç Ã O\nD A    S E N H A',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                'Para recuperar a sua senha, informe seu endereço de e-mail que nós enviaremos um link para alteração da senha.',
              ),
              BaseInput(hintText: 'E-mail'),
              BaseButton(title: 'Enviar', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
