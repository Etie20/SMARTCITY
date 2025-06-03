part of 'report_bloc.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportUploadSuccess extends ReportState {
}
final class ReportGetAllSuccess extends ReportState {
  final List<Report> reports;

  ReportGetAllSuccess(this.reports);
}

final class ReportFailure extends ReportState {
  final String message;

  ReportFailure(this.message);
}