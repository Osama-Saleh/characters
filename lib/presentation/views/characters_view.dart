import 'package:clean_arc/data/api_sevices/characters_api_services.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CharactersApiServices().getAllCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(
                'Error fetching characters: ${snapshot.error.toString()}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text('not Data'),
            );
          }

          return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                // child: Image.network(snapshot.data![index].image.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
