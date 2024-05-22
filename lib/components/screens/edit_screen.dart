import 'package:flutter/material.dart';
import 'register_screen.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edições'),
        centerTitle: true,  // Centra o título na AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Você sabia que todos podem editar a Wikipedia?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'As edições sugeridas são uma nova maneira de editar a Wikipedia no Android. Ajuda você a fazer contribuições pequenas, mas vitais, para a Wikipedia.\n\nNosso objetivo é tornar a edição mais fácil e mais acessível para todos! Entre ou participe da Wikipedia para começar.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar para a tela de cadastro do usuário
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Text('Entrar / juntar-se à Wikipedia'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor do botão
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
