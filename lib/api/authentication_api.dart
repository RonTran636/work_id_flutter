import 'package:chopper/chopper.dart';
import 'package:work_id/constant/common.dart';
import 'package:work_id/constant/key.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_api.chopper.dart';

@ChopperApi(baseUrl: '/api/workid')
abstract class AuthenticationApi extends ChopperService {
  String apiKey = debuggingKey;
  //Register user
  @Post(path: 'auth/register')
  Future<Response> registerUser(@Body() Account account);

  //Check whether user logged in
  @Get(path: 'user-info?')
  Future<Response> checkUserInfo(@Header('Authorization') String token,
      {@Query('api_key') String apiKey = debuggingKey});

  @Post(path: 'auth/login')
  Future<Response> loginWithEmailAndPassword(
      @Query('email') String email, @Query('password') String password,
      {@Query('api_key') String apiKey = debuggingKey});

  static AuthenticationApi create() {
    final client = ChopperClient(
        baseUrl: Common.baseUrl,
        services: [_$AuthenticationApi()],
        converter: JsonConverter());
    return _$AuthenticationApi(client);
  }
}
