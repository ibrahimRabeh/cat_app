import 'package:flutter/material.dart';
import '../cat.dart';
import 'cat_details.dart';
import 'cat_list.dart';

class FavouritesPage extends StatelessWidget {
  final List<Cat> favouriteCats;

  FavouritesPage({required this.favouriteCats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 145, 188),
        title: Text('Favourite Cats'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: favouriteCats.length,
        itemBuilder: (context, index) {
          final cat = favouriteCats[index];
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CatDetailPage(cat: cat)),
            ),
            title: Card(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(
                      cat.imageUrl,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width * 0.40,
                      width: MediaQuery.of(context).size.width * 0.40,
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
