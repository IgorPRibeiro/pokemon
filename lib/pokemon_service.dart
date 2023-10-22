import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/pokemon_api.dart';

class PokemonService {
  final _api = PokemonApi();
  Future<PokemonModelResponse?> getAllPokemon() async {
    return _api.getAllPokemon();
  }
}