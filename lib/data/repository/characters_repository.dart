import 'package:clean_arc/data/api_sevices/characters_api_services.dart';
import 'package:clean_arc/data/models/characters.dart';

class CharactersRepository {
  final CharactersApiServices charactersApiServices;
  CharactersRepository(this.charactersApiServices);

  Future<List<CharactersModel>> getAllCharacters()async{
   final List mapOfCharacters = await charactersApiServices.getAllCharacters();
   final List<CharactersModel> listOfCharacters = [];
   for (var items in mapOfCharacters) {
        var character = CharactersModel.fromJson(items);
        listOfCharacters.add(character); 
      }
      return listOfCharacters;
  }
}