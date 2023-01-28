
import 'package:recru_test/model/recruiter.dart';

abstract class RecruitersRepository {

  Future<List<Recruiter>> getRecruiters(String query);
}
