import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:clean_arc/constants/strings.dart';
import 'package:clean_arc/data/models/characters.dart';
import 'package:http/http.dart' as http;

class CharactersApiServices {
 Future<List<CharactersModel>> getAllCharacters() async {
    try {
    var uri = Uri.parse(AppStrings.basicUrl + 'character');
    http.Response response = await http.get(uri);
    List<CharactersModel> listOfCharacters = [];
    if (response.statusCode == 200) {
      var newRes = jsonDecode(response.body);
      for (var items in newRes['results']) {
        var character = CharactersModel.fromJson(items);
        listOfCharacters.add(character); 
      }
    }
    return listOfCharacters;
    } catch (e) {
      Logger().e("Error getAllCharacters", error: e);
      return [];
      
    //  logger.e("Error getAllCharacters", error: e.toString());
    }
  }
}
