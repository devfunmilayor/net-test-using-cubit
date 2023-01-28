part of 'recruiters_bloc.dart';

@freezed
class RecruitersState with _$RecruitersState {
  const RecruitersState._();

  const factory RecruitersState.initial() = _Initial;

  const factory RecruitersState.loading() = _Loading;

  const factory RecruitersState.error(Exception exception) = _Error;

  const factory RecruitersState.loaded(List<Recruiter> recruiters) = _Loaded;
}
