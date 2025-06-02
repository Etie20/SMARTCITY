import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';

abstract interface class ReportRepository {
  Future<Either<Failure, Report>> createReport({
    required File image,
    required String description,
    required String statusId,
    required String categoryId,
  });
  Future<Either<Failure, List<Report>>> getAllReports();
}
