import 'package:recru_test/model/recruiter.dart';
import 'package:recru_test/repository/recruiters_repository.dart';
import 'package:recru_test/service/recruiters_service.dart';
import 'package:recru_test/service/token_service.dart';

class RecruitersRepositoryLocal implements RecruitersRepository {
  RecruitersRepositoryLocal(this._recruitersService, this._tokenService);

  final RecruitersService _recruitersService;
  final TokenService _tokenService;

  @override
  Future<List<Recruiter>> getRecruiters(String query) async {
    String token = await _tokenService.getToken();
    return _recruitersService.fetchRecruiters(query, token);
  }
}
