import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar uma conta'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                hintText: 'Recomendado para recuperação da conta',
                labelStyle: TextStyle(color: Colors.white),  // Label color
                hintStyle: TextStyle(color: Colors.white30),  // Hint text color
              ),
              style: const TextStyle(color: Colors.white),  // Text color
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),  // Label color
              ),
              style: TextStyle(color: Colors.white),  // Text color
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Repita a senha',
                labelStyle: TextStyle(color: Colors.white),  // Label color
              ),
              style: TextStyle(color: Colors.white),  // Text color
              obscureText: true,
            ),
            SizedBox(height: 10),
            MaterialButton(
              textTheme: ButtonTextTheme.primary,
              child: const Text('Criar conta'),
              onPressed: () async {
                String password = _passwordController.text;
                // Regex for password validation
                RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

                if (!regex.hasMatch(password)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('A senha deve ter pelo menos 8 caracteres, incluindo pelo menos um número e um caractere especial.'),
                    ),
                  );
                  return;
                }
                
                final authResponse = await supabase.auth.signUp(email: _emailController.text, password:_passwordController.text);
             
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Conta criada com sucesso!'),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logged in: ${authResponse.user!.email!}'),
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                // Implemente a navegação para a tela de login
              },
              child: Text('Já tem uma conta? Entrar'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Text button color
              ),
            ),
          ],
        ),
      ),
      );
    }
  }
