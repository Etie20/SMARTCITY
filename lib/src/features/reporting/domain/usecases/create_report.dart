import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/core/usecase/usecase.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';
import 'package:smart_city/src/features/reporting/domain/repositories/report_repository.dart';

class CreateReport implements UseCase<Report, CreateReportParams> {
  final ReportRepository reportRepository;

  CreateReport(this.reportRepository);
  @override
  Future<Either<Failure, Report>> call(CreateReportParams params) async {
    return await reportRepository.createReport(
        image: params.image,
        description: params.description,
        statusId: params.statusId,
        categoryId: params.categoryId);
  }
}

class CreateReportParams {
  final File image;
  final String description;
  final String statusId;
  final String categoryId;

  CreateReportParams({
    required this.image,
    required this.description,
    required this.statusId,
    required this.categoryId,
  });
}
