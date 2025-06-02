import 'dart:io';

import 'package:smart_city/src/core/constants/path_constants.dart';
import 'package:smart_city/src/core/error/exceptions.dart';
import 'package:smart_city/src/features/reporting/data/datasources/report_remote_data_source.dart';
import 'package:smart_city/src/features/reporting/data/models/report_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final SupabaseClient supabaseClient;

  ReportRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<ReportModel> createReport(ReportModel model) async {
    try {
      final reportData = await supabaseClient.from(PathConstants.reporting).insert(model.toJson()).select();
      return ReportModel.fromJson(reportData.first);
    } on PostgrestException catch(e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadReportImage(
      {required File image, required ReportModel model}) async {
    try {
      await supabaseClient.storage.from('report_images').upload(model.reportId, image);
      return supabaseClient.storage.from('report_images').getPublicUrl(model.reportId);
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ReportModel>> getAllReports() async {
    try {
      final res = await supabaseClient.from(PathConstants.reporting).select('*, ${PathConstants.picture}(photo_url)');
      return res
          .map(
            (report) => ReportModel.fromJson(report).copyWith(
          image: report[PathConstants.picture]['photo_url'],
        ),
      )
          .toList();
    } on PostgrestException catch(e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}