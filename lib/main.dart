import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recru_test/repository/recruiters_repository_local.dart';
import 'package:recru_test/service/recruiters_service_local.dart';
import 'package:recru_test/service/token_service_local.dart';

import 'feature/recruiters_list/recruiters_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => RecruitersRepositoryLocal(
        RecruitersServiceLocal(),
        TokenServiceLocal(),
      ),
      child: const MaterialApp(
        home: RecruitersScreen(),
      ),
    );
  }
}
