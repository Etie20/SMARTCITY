import 'dart:io';

import 'package:smart_city/src/features/reporting/data/models/report_model.dart';

abstract interface class ReportRemoteDataSource {
  Future<ReportModel> createReport(ReportModel model);
  Future<String> uploadReportImage({
    required File image,
    required String reportId,
  });
  Future<List<ReportModel>> getAllReports();
}
