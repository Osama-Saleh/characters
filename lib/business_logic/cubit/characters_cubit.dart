import 'package:bloc/bloc.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:clean_arc/data/repository/characters_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  static CharactersCubit get(context) => BlocProvider.of(context);

  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();


  List<CharactersModel> allCharacterss = [];
  Future<List<CharactersModel>> getAllCharacters() async {
    allCharacterss = await charactersRepository.getAllCharacters();
    emit(CharactersLoaded(characters: allCharacterss));
    return allCharacterss;
  }

  void changeSearchIcon(bool isChange) {
    isSearching = isChange;
    emit(CharactersLoaded(characters: allCharacterss));
  }

  List<CharactersModel> searchCharacters = [];
  void onSearch(String character) {
    searchCharacters = allCharacterss
        .where((chars) => chars.name!.toLowerCase().startsWith(character))
        .toList();
    emit(CharactersLoaded(characters: searchCharacters));
  }

  void clearSearch() {
    searchController.clear();
    emit(CharactersLoaded(characters: allCharacterss));
  }
}
