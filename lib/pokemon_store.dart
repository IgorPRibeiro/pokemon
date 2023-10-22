import 'package:flutter/cupertino.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/pokemon_service.dart';

class PokemonStore extends ChangeNotifier {
  final service = PokemonService();

  var isLoading = false;
  var error = '';
  var pokemons = <Pokemon>[];

  getPokemons() async {

    isLoading = true;
    error = '';
    // notify listeners (screen) about the change of state
    // notificar ouvintes (telas) sobre a mundaca do state
    notifyListeners();

    try {
      final pokemons = await service.getAllPokemon();

      if (pokemons!.results.isNotEmpty) {
        this.pokemons = pokemons!.results;
        isLoading = false;
        notifyListeners();
      } else {
        throw Exception(pokemons);
      }
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

}