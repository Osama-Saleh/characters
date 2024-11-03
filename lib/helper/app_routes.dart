import 'package:clean_arc/business_logic/cubit/characters_cubit.dart';
import 'package:clean_arc/data/api_sevices/characters_api_services.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:clean_arc/data/repository/characters_repository.dart';
import 'package:clean_arc/presentation/views/character_details_view.dart';
import 'package:clean_arc/presentation/views/characters_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRoutes(){
    charactersRepository = CharactersRepository(CharactersApiServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  static const String charactersView = '/';
  static const String charactersDetailsView = '/charactersDetailsView';

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CharactersCubit(charactersRepository),
            child: CharactersView(),
          ),
        );
      case charactersDetailsView:
      final character = settings.arguments as CharactersModel ;
        return MaterialPageRoute(builder: (context) => CharacterDetailsView(charactersModel: character,),);
    }
  }
}
