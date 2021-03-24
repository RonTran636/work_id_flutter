// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AuthenticationApi extends AuthenticationApi {
  _$AuthenticationApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AuthenticationApi;

  Future<Response> registerUser(Account account) {
    final $url = '/api/workid/auth/register';
    final $body = account;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> checkUserInfo(String token, {String apiKey = debuggingKey}) {
    final $url = '/api/workid/user-info?';
    final Map<String, dynamic> $params = {'api_key': apiKey};
    final $headers = {'Authorization': token};
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> loginWithEmailAndPassword(String email, String password,
      {String apiKey = debuggingKey}) {
    final $url = '/api/workid/auth/login';
    final Map<String, dynamic> $params = {
      'email': email,
      'password': password,
      'api_key': apiKey
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
