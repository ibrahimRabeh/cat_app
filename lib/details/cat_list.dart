// File: lib/screens/cat_list_page.dart
import 'package:flutter/material.dart';
import '../cat.dart';
import 'cat_details.dart';
import 'favourites_page.dart';

class CatListPage extends StatelessWidget {
  final List<Cat> cats;

  CatListPage({required this.cats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 145, 188),
        title: Row(children: [
          Expanded(child: Text('Cats')),
          IconButton(
            icon: Icon(
              Icons.favorite, // Add the icon you want to display here
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouritesPage(
                    favouriteCats:
                        cats.where((cat) => cat.isFavourite).toList(),
                  ),
                ),
              );
            },
          )
        ]),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: cats.length,
        itemBuilder: (context, index) {
          final cat = cats[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatDetailPage(cat: cat),
                ),
              );
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Container(
                    // 40% of screen width

                    child: Image.network(
                      cat.imageUrl,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width * 0.40,
                      width: MediaQuery.of(context).size.width * 0.50,
                    ),
                  ),
                  Text(cat.name,
                      selectionColor: Colors.red,
                      style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
