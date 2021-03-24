import 'dart:async';
import 'models/account.dart';

class UserRepository {
  Account? _currentuser;
  Future<Account?> getCurrentUser() async {
    if (_currentuser != null) return _currentuser;
    return Future.delayed(
        const Duration(seconds: 300),
        //Change to retrieve info from backend
        () => _currentuser = Account());
  }
}
