import 'package:recru_test/model/recruiter.dart';
import 'package:recru_test/service/recruiters_service.dart';

class RecruitersServiceLocal implements RecruitersService {
  @override
  Future<List<Recruiter>> fetchRecruiters(String query, String token) =>
      Future.value(
        List.generate(
          20,
          (index) => Recruiter(
            name: "name",
            surname: index.toString(),
          ),
        ),
      );
}
