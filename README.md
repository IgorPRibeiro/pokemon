# pokemon_flutter

A new Flutter project. Created for study state architecture.

# Separando o store em camadas / Gerenciando o estado

- Criando uma classe apenas para o controle de estado ( `pokemon_store.dart` ).
  - 1º forma:
    - Chamando o `notifyListeners()` no controller (reatividade). Forma de informar a View que o estado foi atualizado;
    - Criar um `store.addListener()` na tela e executar o `setState` para atualizar o estado da tela;
  