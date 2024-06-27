import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio(int numeroMaximo){
    Random numeroaleatorio = Random();
    return numeroaleatorio.nextInt(numeroMaximo);
  }
}