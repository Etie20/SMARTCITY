import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:smart_city/src/core/constants/path_constants.dart';
import 'package:smart_city/src/core/error/exceptions.dart';
import 'package:smart_city/src/features/reporting/data/datasources/report_remote_data_source.dart';
import 'package:smart_city/src/features/reporting/data/models/report_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource {
  final SupabaseClient supabaseClient;

  ReportRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<ReportModel> createReport(ReportModel model) async {
    try {
      final reportData = await supabaseClient
          .from(PathConstants.reporting)
          .insert(model.toJson())
          .select();
      return ReportModel.fromJson(reportData.first);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadReportImage(
      {required File image, required String reportId}) async {
    try {
      // 1. Upload de l'image dans le storage Supabase
      await supabaseClient.storage
          .from('report_images')
          .upload(reportId, image);

      // 2. Récupération de l'URL publique
      final imageUrl = supabaseClient.storage
          .from('report_images')
          .createSignedUrl(reportId, 3600);

      return imageUrl;
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ReportModel>> getAllReports() async {
    try {
      final res = await supabaseClient
          .from(PathConstants.reporting)
          .select('*, ${PathConstants.picture}(photo_url)');
      // debugPrint("yolo get reports");
      // debugPrint(res.toString());
      // return res
      //     .map(
      //       (report) => ReportModel.fromJson(report).copyWith(
      //     image: report[PathConstants.picture]['photo_url'],
      //   ),
      // )
      //     .toList();
      return res.map((report) => ReportModel.fromJson(report)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
