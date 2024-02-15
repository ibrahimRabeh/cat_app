// File: lib/screens/cat_detail_page.dart
import 'package:flutter/material.dart';
import '../cat.dart';

class CatDetailPage extends StatelessWidget {
  final Cat cat;

  CatDetailPage({required this.cat});

  get body => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 145, 188),
        title: Row(children: [
          Expanded(child: Text(cat.name)),
          IconButton(
            icon: Icon(
              cat.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: cat.isFavourite ? Colors.red : Colors.grey,
              size: 30,
            ),
            onPressed: () {
              cat.toggleFavourite();

              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CatDetailPage(cat: cat),
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    cat.isFavourite
                        ? '${cat.name} added to favourites'
                        : '${cat.name} removed from favourites',
                  ),
                ),
              );
            },
          )
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(cat.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              cat.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              cat.origin,
              style: TextStyle(fontSize: 16),
            ),
            Text('Name: ${cat.name}'),
            Text('Max Weight: ${cat.maxWeight}'),
            Text('Min Weight: ${cat.minWeight}'),
            Text('Max Life Span: ${cat.intelligence}'),
            Text('Average Length: ${cat.length}'),
          ],
        ),
      ),
    );
  }
}
