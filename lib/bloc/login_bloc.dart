import 'dart:async';
import 'package:work_id/events/login_events.dart';
import 'package:user_repository/user_repository.dart';

class LoginBloc {
  final _loginStateController = StreamController<Account>(); 
}
