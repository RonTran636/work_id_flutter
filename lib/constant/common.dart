import 'package:work_id/constant/constant.dart';
import 'package:work_id/constant/key.dart';
import 'package:work_id/models/account.dart';

class Common {
  static late Account currentUser;
  static final String baseUrl = deBuggingServerUrl;
  static final String socketUrl = deBuggingSocketUrl;
  static final String apiKey = debuggingKey;
}
