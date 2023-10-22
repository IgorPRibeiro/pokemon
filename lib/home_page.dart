import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/pokemon_service.dart';
import 'package:pokemon_flutter/pokemon_store.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final store = PokemonStore();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(listenable: store, builder: (context, child) {
      Widget body = Container();
      if (store.isLoading) {
        body = const Center(
          child: CircularProgressIndicator(),
        );
      } else if (store.error.isNotEmpty) {
        body = Center(
          child: ElevatedButton(
            onPressed: store.getPokemons,
            child: Text(store.error),
          ),
        );
      } else {
        body = ListView.builder(
            itemCount: store.pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = store.pokemons[index];
              return ListTile(
                title: Text(pokemon.name),
              );
            });
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text("Pokemon"),
        ),
        body: body,
      );
    });

}
