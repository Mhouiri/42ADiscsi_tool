
import 'dart:convert';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_auth/identifiers.dart';

class Authenticate {
  String code;
  String accessToken;
  String endpointUrl = 'https://api.intra.42.fr/oauth/authorize';
  Map<String, String> queryParams = {
    'client_id': CLIENT_ID,
    'redirect_uri': REDIRECT_URI,
    'scope': 'public',
    'response_type': 'code',
    'state': '123',
  };

  Future<void> authorizeUser() async{
    String requestUrl = this.endpointUrl + '?' + Uri(queryParameters: this.queryParams).query;
    final result = await FlutterWebAuth.authenticate(
        url: requestUrl, callbackUrlScheme: "app");
    this.code = Uri.parse(result).queryParameters['code'];
  }

  Future<void> getAccessToken() async{
    final response =
    await http.post('https://api.intra.42.fr/oauth/token', body: {
      'grant_type': 'authorization_code',
      'client_id': CLIENT_ID,
      'client_secret': CLIENT_SECRET,
      'redirect_uri': 'app://test',
      'code': this.code,
      'state': '123',
    });
    this.accessToken = jsonDecode(response.body)['access_token'] as String;
  }
}


