import 'dart:developer' as developer;

import 'package:get/get.dart';
import 'package:work_id/api/authentication_service.dart';
import 'package:work_id/models/account.dart';

class LoginController extends GetxController {
  var listAccount = <Account>[].obs;
  var currentUser = Account().obs;

  void registerUserToDatabase(Account account) async {
    currentUser.value =
        await AuthenticationService.registerUserToDatabase(account);
    developer.log(currentUser.value.toString(), name: 'Current User:');
  }

  void loginWithEmailAndPassword(String email, String password) async {
    currentUser.value =
        await AuthenticationService.loginWithEmailAndPassword(email, password);
    developer.log(currentUser.value.toString(), name: 'Current User:');
  }
}
