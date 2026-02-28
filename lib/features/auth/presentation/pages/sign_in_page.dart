import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_button.dart';
import 'package:minimalist_shopping_list/core/design_system/widgets/inputs/base_input.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 80, color: colorScheme.inversePrimary),
              Text('L O G I N', style: TextStyle(fontSize: 20)),
              SizedBox.shrink(),
              BaseInput(hintText: 'E-mail'),
              BaseInput(hintText: 'Senha', obscureText: true),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () => context.push(Routes.forgotPassword),
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox.shrink(),
              BaseButton(title: 'Entrar', onPressed: () {}),
              SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ainda não possui uma conta? '),
                  GestureDetector(
                    onTap: () => context.push(Routes.register),
                    child: Text(
                      'Se cadastre aqui',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
