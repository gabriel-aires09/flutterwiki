import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Pesquisar na Wikipedia",
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Histórico', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          historyItem('6 de mai. de 2024', 'Scranton (Pensilvânia)', 'assets/images/scranton.jpg'),
          historyItem('25 de abr. de 2024', 'ZBrush', null),
          historyItem('20 de abr. de 2024', 'Richard Gadd', null),
          historyItem('11 de abr. de 2024', 'ChatGPT', 'assets/images/chatgpt.jpg'),
        ],
      ),
    );
  }

  Widget historyItem(String date, String title, String? imagePath) {
    return ListTile(
      leading: imagePath != null ? Image.asset(imagePath, width: 56, height: 56) : null,
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(date, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert, color: Colors.white),
    );
  }
}
