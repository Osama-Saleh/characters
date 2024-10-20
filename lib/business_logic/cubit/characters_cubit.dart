import 'package:bloc/bloc.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:clean_arc/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  Future<List<CharactersModel>> getAllCharacters() async{
   var characters = await charactersRepository.getAllCharacters();
    emit(CharactersLoaded(characters: characters));
    return characters;
  }
  
}
