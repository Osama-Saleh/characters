import 'package:clean_arc/presentation/views/characters_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
 static const String charactersView = '/';

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case charactersView:
        return MaterialPageRoute(builder: (context) => CharactersView());
    }
  }
}