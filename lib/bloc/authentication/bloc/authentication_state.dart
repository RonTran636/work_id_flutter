part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.account = Account.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(Account account)
      : this._(status: AuthenticationStatus.authenticated, account: account);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final Account account;

  @override
  List<Object?> get props => [status, account];
}