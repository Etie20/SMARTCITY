import 'package:fpdart/fpdart.dart';
import 'package:smart_city/src/core/error/failures.dart';
import 'package:smart_city/src/core/usecase/usecase.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';
import 'package:smart_city/src/features/reporting/domain/repositories/report_repository.dart';

class GetAllReports implements UseCase<List<Report>, NoParams> {
  final ReportRepository reportRepository;

  GetAllReports(this.reportRepository);

  @override
  Future<Either<Failure, List<Report>>> call(NoParams params) async {
    return await reportRepository.getAllReports();
  }
}
