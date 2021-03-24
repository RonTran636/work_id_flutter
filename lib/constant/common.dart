import 'package:work_id/constant/constant.dart';
import 'package:user_repository/user_repository.dart';

class Common {
  static late Account currentUser;
  static final String baseUrl = deBuggingServerUrl;
  static final String socketUrl = deBuggingSocketUrl;
}
