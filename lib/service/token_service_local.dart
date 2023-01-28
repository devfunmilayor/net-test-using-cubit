import 'package:recru_test/service/token_service.dart';

class TokenServiceLocal implements TokenService {
  @override
  Future<String> getToken() => Future.value("123");
}
