import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Article> articles = [
      Article(
        title: 'Pablo Marçal',
        subtitle: 'empresário e político brasileiro',
        views: '33 mil',
        imageUrl: 'assets/images/pablo.jpeg'  // Caminho atualizado para as imagens
      ),
      Article(
        title: 'Liga dos Campeões da UEFA',
        subtitle: 'competição de clubes de futebol europeus',
        views: '32 mil',
        imageUrl: 'assets/images/uefa.jpg'
      ),
      Article(
        title: 'Rio Grande do Sul',
        subtitle: 'unidade federativa do Brasil',
        views: '24 mil',
        imageUrl: 'assets/images/riogrande.jpg'
      ),
      Article(
        title: 'José Castelo Branco',
        subtitle: 'negociador de arte, cantor, personalidade',
        views: '21 mil',
        imageUrl: 'assets/images/jose.jpg'
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // ignore: unnecessary_null_comparison
            leading: Image.asset(articles[index].imageUrl, width: 56, height: 56),
            title: Text(articles[index].title),
            subtitle: Text(articles[index].subtitle),
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(builder: (_) => DetailScreen(
                title: articles[index].title,
                description: articles[index].subtitle,
                )),
              ),
          );
        },
      ),
    );
  }
}

class Article {
  final String title;
  final String subtitle;
  final String views;
  final String imageUrl;

  Article({required this.title, required this.subtitle, required this.views, required this.imageUrl});
}
