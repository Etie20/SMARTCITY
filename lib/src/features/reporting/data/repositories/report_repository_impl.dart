import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/constants/constants.dart';
import 'package:smart_city/src/core/error/exceptions.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/core/network/connection_checker.dart';
import 'package:smart_city/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:smart_city/src/features/reporting/data/datasources/report_remote_data_source.dart';
import 'package:smart_city/src/features/reporting/data/models/report_model.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';
import 'package:smart_city/src/features/reporting/domain/repositories/report_repository.dart';
import 'package:uuid/uuid.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource reportRemoteDataSource;
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker connectionChecker;

  ReportRepositoryImpl(this.reportRemoteDataSource, this.connectionChecker, this.authRemoteDataSource);

  @override
  Future<Either<Failure, Report>> createReport(
      {required File image,
      required String description,
      required String statusId,
      required String categoryId}) async {
    try {
      if (!await connectionChecker.isConnected) {
        return left(Failure(Constants.noConnectionMessage));
      }

      // final user = await authRemoteDataSource.getCurrentUserData();
      // if (user == null) {
      //   return left(
      //     Failure('User not logged in!'),
      //   );
      // }

      var id = const Uuid().v1();

      String imageUrl = await reportRemoteDataSource.uploadReportImage(
        image: image,
        reportId: id,
      );

      ReportModel reportModel = ReportModel(
        reportId: const Uuid().v1(),
        description: description,
        categoryId: categoryId,
        dateCreation: DateTime.now(),
        statusId: Constants.defaultStatus,
        userId: '9a27110a-0594-4257-9ab7-61370feebca1',
        image: imageUrl
      );

      final uploadedReport = await reportRemoteDataSource.createReport(reportModel);

      return right(uploadedReport);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Report>>> getAllReports() async {
    try {
      var reports = <ReportModel>[];
      if (!await connectionChecker.isConnected) {
      } else {
        reports = await reportRemoteDataSource.getAllReports();
      }
      return right(reports);
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
