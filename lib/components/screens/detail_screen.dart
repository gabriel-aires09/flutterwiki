import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  final String title;
  final String description;

  DetailScreen({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 16.0, height: 1.5),
            ),
            SizedBox(height: 20),
            // Você pode adicionar mais elementos aqui conforme necessário
          ],
        ),
      ),
    );
  }
}
