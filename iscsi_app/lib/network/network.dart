
import 'dart:convert';

import 'package:flutter_auth/model/UserProfil.dart';
import 'package:http/http.dart' as http;

class Network {

  Future<UserProfileModal> getUserData(String accessToken) async{
    try{
      final response = await http.get('https://api.intra.42.fr/v2/me', headers: {
        'Authorization': 'Bearer $accessToken',
      });
        if (response.statusCode == 200)
        {
          return UserProfileModal.fromJson(json.decode(response.body));
        }
    } catch(e) {
      throw Exception(e);
    }
    return null;
  }
}