import 'package:dnd_character_app/models/character.dart';
import 'package:dnd_character_app/services/firestore_service.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [];

  get characters => _characters;

  // add character
  void addCharacter(Character character) async {
    await FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  // save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }


  // remove character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }


  // initially fetch characters
  void fetchCharactersOnce() async {
  if (_characters.isEmpty) {
    final snapshot = await FirestoreService.getCharactersOnce();

    for (var doc in snapshot.docs) {
      final fetched = doc.data();
      // check by id before adding
      if (!_characters.any((c) => c.id == fetched.id)) {
        _characters.add(fetched);
      }
    }

    notifyListeners();
  }
}

}
