import '../model/card_detail.dart';

class CardDetailRapository {

  Future<CardDetail> get() async {
    await Future.delayed(Duration(seconds: 1));

    return CardDetail( 
      1,
      "Bem vindo",
    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
    "A automação de testes mobile é a prática de usar ferramentas e scripts para automatizar a execução de testes em aplicativos móveis. Isso pode ajudar a melhorar a qualidade dos aplicativos, reduzir o tempo e o custo do processo de teste e liberar os testadores para se concentrarem em testes mais complexos. Qualidade Aprimorada: Ao automatizar tarefas repetitivas, a automação de testes permite a execução de testes mais frequente e completa, levando à detecção e correção mais precoce de defeitos. Custos Reduzidos: A automação ajuda a economizar tempo e recursos antes dedicados ao teste manual, levando à economia geral de custos no ciclo de desenvolvimento. Maior Cobertura: A automação permite a execução de um maior volume de testes, potencialmente cobrindo mais casos de borda e cenários complexos em comparação com o teste manual."

    );
  }
}