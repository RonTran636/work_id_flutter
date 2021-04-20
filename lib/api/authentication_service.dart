import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:work_id/constant/common.dart';
import 'package:work_id/models/account.dart';
import 'dart:developer' as developer;

class AuthenticationService {
  static var client = http.Client();

  //Login with given email and password
  static Future<Account> loginWithEmailAndPassword(String email,String password) async{
    var uri = Uri.https(Common.baseUrl, '/api/workid/auth/login/',{
      'email': email,
      'password': password,
      'api_key': Common.apiKey
    });

    final response = await client.post(uri);
    if (response.statusCode == 200){
      final body = jsonDecode(response.body);
      return Account.fromMap(body['result']);
    }else{
      throw Exception('Login failed');
    }
  }

  //Register User
  static Future<Account> registerUserToDatabase(Account account) async{
    var uri = Uri.https(Common.baseUrl, '/auth/register');
    final response = await client.post(uri,
    body: jsonEncode(<String,String>{
      'customer_name': account.customerName!,
      'customer_email': account.customerEmail!,
      'password': account.password!,
      'fcm_token': account.fcmToken!
    }));
    if (response.statusCode == 200){
      return Account.fromMap(jsonDecode(response.body));
    }else{
      throw Exception('Something went wrong');
    }
  }
}