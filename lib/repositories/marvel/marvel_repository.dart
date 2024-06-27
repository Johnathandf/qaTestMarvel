import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trilhaapp/model/characters_model.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters(int offset) async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.env['MARVELPUBLICKEY'];
    var privateKey = dotenv.env['MARVELAPIKEY'];

    if (publicKey == null || privateKey == null) {
      throw Exception("Chaves da API não configuradas corretamente no .env");
    }

    var hash = _generateMd5(ts + privateKey + publicKey);
    var query = "offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash";
    var url = "https://gateway.marvel.com/v1/public/characters?$query";

    try {
      var result = await dio.get(url);
      var charactersModel = CharactersModel.fromJson(result.data);
      return charactersModel;
    } catch (e) {
      print("Erro ao obter personagens: $e");
      throw e;
    }
  }

  String _generateMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
