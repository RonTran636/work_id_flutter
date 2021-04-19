import 'package:http/http.dart' as http;
import 'package:work_id/models/account.dart';

class RemoteService {
  static var client = http.Client();
  static Future<Account> fetchData() async{
    var response = await client.get
  }
}