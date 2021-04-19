import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:work_id/constant/common.dart';
import 'package:work_id/models/account.dart';
import 'package:work_id/models/authorization.dart';
import 'package:work_id/models/server_user.dart';

class AuthenticationApi {
  static var client = http.Client();

  static Future<ServerUser> registerUserToDatabase(Account body) async {
    return http.post(
      Uri.https(Common.baseUrl),
      body: jsonEncode(body)
    )
  }

  static Future<Authorization> getUserInfo() async {
    var queries = {
      ''
    };
    Uri uri = Uri.https(Common.baseUrl,"/api/workid/user-info?");
  }
}