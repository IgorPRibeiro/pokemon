# pokemon_flutter

A new Flutter project. Created for study state architecture.
Usem os commits como referencia de estudo.


# Separando o store em camadas / Gerenciando o estado

***representar o estado -> gerenciar o estado -> distribuir o estado***

- 1º forma (representar os estado):
  - Usando a propria tela para chamar o estados deixando tudo em arquivo apenas ;
  
- 2º forma (gerenciar o estado) :
    - Criando um arquivo (`pokemon_store.dart`) para GERENCIAR o estado. Retirando da tela e organinzando o código.;
    - Chamando o `notifyListeners()` no controller (reatividade). Forma de informar a View que o estado foi atualizado;
    - Criar um `store.addListener()` na tela e executar o `setState` para atualizar o estado da tela;
    
- 3º forma (distribuir o estado):
    - Usar um componente para assinar/monitorar(distribuir) essa reatividade;
      - Dessa forma não será preciso a criação do `addListener()` na tela;
    - Usando o `ListenableBuilder`, passando o nosso `store` para ser assinado/monitorado e o que será renderizado no builder 
      - Com isso o Widget (componente) não precisará ser Stateful, podendo ser StateLess
  