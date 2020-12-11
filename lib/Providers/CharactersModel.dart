import 'dart:collection';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:project_1/Model/Character.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';


const textUrl = "https://gist.githubusercontent.com/thomasbeau37/fc127fb6bb4a2c02138636a490a2f3a0/raw/075a908cd811b18ae8cd4e0a31bd67a21803d8cb/charactersv2.json";


Future <Iterable<Character>> getCharactersFromInternet() async{
  try{
    final response = await http.get(textUrl);
    if(response.statusCode == 200){
      List json = jsonDecode(response.body);
      final characters = json.map((e) => new Character.fromJson(e)).toList();
      return characters;
    }
  }catch(error){
    print(error);
  }
  return [];
}

Future<CharactersModel> loadModelFromInternet() async {
  final model = CharactersModel();
  final characters = await getCharactersFromInternet();
  model.addAll(characters);
  return model;
}

class CharactersModel extends ChangeNotifier {
  final List<Character> _characters = [];
  UnmodifiableListView<Character> get characters => UnmodifiableListView<Character>(_characters);

  bool finishedDownloading = false;

  CharactersModel(){
    getCharactersFromInternet().then((characters)  {
      addAll(characters);
      finishedDownloading = true;
      notifyListeners();
    });
  }

  Character getByName(Character char, List<Character> list){
      for(var perso in list) {
        if (perso.name == char.name) {
          notifyListeners();
          return perso;
        }
      }
  }

  void add(Character character){
    _characters.add(character);
    notifyListeners();
  }

  void addAll(Iterable<Character> characters){
    _characters.addAll(characters);
    notifyListeners();
  }
}

class CharactersModel2 extends ChangeNotifier {
  final List<Character> _characters = [];
  UnmodifiableListView<Character> get characters => UnmodifiableListView<Character>(_characters);

  bool finishedDownloading = false;

  CharactersModel(){
    getCharactersFromInternet().then((characters)  {
      addAll(characters);
      finishedDownloading = true;
      notifyListeners();
    });
  }

  Character getByName(Character char, List<Character> list){
    for(var perso in list) {
      if (perso.name == char.name) {
        notifyListeners();
        return perso;
      }
    }
  }

  void add(Character character){
    _characters.add(character);
    notifyListeners();
  }

  void addAll(Iterable<Character> characters){
    _characters.addAll(characters);
    notifyListeners();
  }
}