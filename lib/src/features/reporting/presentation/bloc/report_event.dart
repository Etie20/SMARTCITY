part of 'report_bloc.dart';

@immutable
sealed class ReportEvent {}

final class ReportUpload extends ReportEvent {
  final String description;
  final String categoryId;
  final String statusId;
  final File image;

  ReportUpload({
    required this.description,
    required this.categoryId,
    required this.statusId,
    required this.image,
  });
}

final class ReportFetchAll extends ReportEvent {}