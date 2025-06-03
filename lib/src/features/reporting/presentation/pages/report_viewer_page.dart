import 'package:flutter/material.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';

class ReportViewerPage extends StatelessWidget {
  static route(Report report) =>
      MaterialPageRoute(builder: (context) => ReportViewerPage(report: report));

  final Report report;
  const ReportViewerPage({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
