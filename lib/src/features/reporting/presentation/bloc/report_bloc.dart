import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/src/core/usecase/usecase.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';
import 'package:smart_city/src/features/reporting/domain/usecases/create_report.dart';
import 'package:smart_city/src/features/reporting/domain/usecases/get_all_reports.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final CreateReport _createReport;
  final GetAllReports _getAllReports;
  ReportBloc({
    required CreateReport createReport,
    required GetAllReports getAllReports
  }) : _createReport = createReport,
       _getAllReports = getAllReports, super(ReportInitial()) {
    on<ReportEvent>((event, emit) => emit(ReportLoading()));
    on<ReportUpload>(_onCreateReport);
    on<ReportFetchAll>(_onAllReportsRequested);
  }

  FutureOr<void> _onCreateReport(
      ReportUpload event, Emitter<ReportState> emit) async {
    final res = await _createReport(
      CreateReportParams(
        image: event.image,
        description: event.description,
        statusId: event.statusId,
        categoryId: event.categoryId,
      ),
    );

    res.fold(
          (l) => emit(ReportFailure(l.message)),
          (_) => emit(ReportUploadSuccess()),
    );
  }

  FutureOr<void> _onAllReportsRequested(
      ReportFetchAll event, Emitter<ReportState> emit) async {
    final res = await _getAllReports(NoParams());

    res.fold(
          (l) => emit(ReportFailure(l.message)),
          (r) => emit(ReportGetAllSuccess(r)),
    );
  }
}