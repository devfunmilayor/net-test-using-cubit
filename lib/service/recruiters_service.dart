import 'package:recru_test/model/recruiter.dart';

abstract class RecruitersService {

  Future<List<Recruiter>> fetchRecruiters(String query, String token);
}
