import 'package:clean_arc/data/api_sevices/characters_api_services.dart';
import 'package:clean_arc/helper/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRoutes:AppRoutes() ,));
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  const MyApp({super.key,required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:appRoutes.generateRoute ,
      // onGenerateRoute:AppRoutes().generateRoute ,

    );
  }
}
