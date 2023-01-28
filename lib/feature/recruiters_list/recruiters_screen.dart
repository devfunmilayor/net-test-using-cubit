// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/recruiters_bloc.dart';
import '../../repository/recruiters_repository.dart';

class RecruitersScreen extends StatefulWidget {
  const RecruitersScreen({Key? key}) : super(key: key);

  @override
  State<RecruitersScreen> createState() => _RecruitersScreenState();
}

class _RecruitersScreenState extends State<RecruitersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (blocContext) => RecruitersCubit(
          blocContext.read<RecruitersRepository>(),
        ),
        // ignore: todo
        // No need for a fancy UI, simple Texts would be enough
        child: RecruitmentSubWidget(),
      ),
    );
  }
}

class RecruitmentSubWidget extends StatelessWidget {
  const RecruitmentSubWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecruitersCubit, RecruitersState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (exception) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Error $exception ')));
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
            body: state.when(
                initial: () => Text('Initial-Loading'),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (e) => Center(
                      child: Text('error data: $e'),
                    ),
                loaded: (dataResp) {
                  return Text('data ${dataResp.toList()}');
                }));
      },
    );
  }
}


// Expanded(
//             child: Text("Recruiters list")),