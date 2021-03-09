import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_state.dart';
import 'package:YOURDRS_FlutterAPP/network/models/appointment.dart';
import 'package:YOURDRS_FlutterAPP/network/models/schedule.dart';

class PatientAppointmentBlocState extends BaseBlocState {
  final bool isLoading;
  final String errorMsg;
  final List<Patients> users;
  final String keyword;
  final DateTime keyword1;
  final List<ScheduleList> patients;

  factory PatientAppointmentBlocState.initial() => PatientAppointmentBlocState(
        errorMsg: null,
        isLoading: false,
        users: null,
      );

  PatientAppointmentBlocState reset() => PatientAppointmentBlocState.initial();

  PatientAppointmentBlocState(
      {this.isLoading = false,
      this.errorMsg,
      this.users,
      this.keyword,
      this.patients,
      this.keyword1});

  @override
  List<Object> get props =>
      [this.isLoading, this.errorMsg, this.users, this.keyword, this.patients];

  PatientAppointmentBlocState copyWith(
      {bool isLoading,
      String errorMsg,
      List<Patients> users,
      String keyword,
      DateTime keyword1,
      List<ScheduleList> patients}) {
    return new PatientAppointmentBlocState(
        isLoading: isLoading ?? this.isLoading,
        errorMsg: errorMsg ?? this.errorMsg,
        users: users ?? this.users,
        keyword: keyword ?? this.keyword,
        keyword1: keyword1 ?? this.keyword1,
        patients: patients ?? this.patients);
  }

  @override
  String toString() {
    return 'PatientAppointmentMainState{isLoading: $isLoading, errorMsg: $errorMsg, users: $users, keyword: $keyword},patients:$patients';
  }
}
