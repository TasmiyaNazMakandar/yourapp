import 'package:YOURDRS_FlutterAPP/blocs/base/base_bloc_event.dart';
import 'package:flutter/widgets.dart';

abstract class PatientAppointmentBlocEvent extends BaseBlocEvent {}

class GetPatientAppointmentBlocEvent extends PatientAppointmentBlocEvent {
  @override
  List<Object> get props => [];
}

class SearchPatientEvent extends PatientAppointmentBlocEvent {
  final String keyword;

  SearchPatientEvent({@required this.keyword});

  @override
  List<Object> get props => [this.keyword];
}

class GetProvidersListEvent extends PatientAppointmentBlocEvent {
  final String memberId;

  GetProvidersListEvent({this.memberId});

  @override
  List<Object> get props => [this.memberId];
}

// Creating an event GetSchedulePatientList
class GetSchedulePatientsList extends PatientAppointmentBlocEvent {
  final DateTime keyword1;
  GetSchedulePatientsList({@required this.keyword1});
  @override
  List<Object> get props => [this.keyword1];
}
