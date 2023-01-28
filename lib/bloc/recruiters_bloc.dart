// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recru_test/repository/recruiters_repository.dart';

import '../model/recruiter.dart';

part 'recruiters_bloc.freezed.dart';

part 'recruiters_state.dart';

class RecruitersCubit extends Cubit<RecruitersState> {
  RecruitersCubit(this._recruitersRepository)
      : super(const RecruitersState.initial());

  final RecruitersRepository _recruitersRepository;

  List<Recruiter> dataR = [];

  void loadRecruiters(String query) async {
    try {
      emit(RecruitersState.loading());
      dataR = _recruitersRepository.getRecruiters(query) as List<Recruiter>;

      emit(RecruitersState.loaded(dataR));
    } catch (e) {
      log("$e");
      emit(RecruitersState.error(e as Exception));
    }
  }
}
