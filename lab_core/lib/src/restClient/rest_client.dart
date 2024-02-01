
// gerenciador de requisições http utilizando o dio 
// o que é o dio? Um poderoso pacote de rede HTTP para Dart/Flutter, 
// suporta configuração global, interceptores, FormData, Solicitar 
// cancelamento, upload/download de arquivos, Tempo limite, 
// adaptadores personalizados, transformadores, etc.

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

//classe para requisição http com o dio
final class RestClient extends DioForNative {
  //requisão para o back-end
  RestClient(String baseUrl)
    : super (
      BaseOptions(
        //endpoint para requisição
        baseUrl: baseUrl,

        //tempo de resposta do back-end
        connectTimeout: const Duration(seconds: 10),

        //tempo de resposta da aplicação
        receiveTimeout: const Duration(seconds: 60)
      )
    );
  
  //requisição autenticada
  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  //requisição não autenticada
  RestClient get unauth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}