import 'dart:convert';

import 'package:crypto_mob_app/services/services.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future getPrice(String url) async{
    http.Response response = await http.get(Uri.parse(url));

    try{
      if(response.statusCode != 200){
        throw errorHandler(response);
      } else{
        return await jsonDecode(response.body);
      }
    }catch (e){
      rethrow;
    }
  }

}