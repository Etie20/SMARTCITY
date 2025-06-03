import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_city/src/core/common/widgets/loader.dart';
import 'package:smart_city/src/core/utils/show_snackbar.dart';
import 'package:smart_city/src/features/reporting/presentation/bloc/report_bloc.dart';
import 'package:smart_city/src/features/reporting/presentation/pages/add_new_report_page.dart';
import 'package:smart_city/src/features/reporting/presentation/widgets/report_card.dart';

class ReportPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const ReportPage());
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReportBloc>().add(ReportFetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'What\'s New?',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context, AddNewReportPage.route());
              },
              icon: const Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          if (state is ReportFailure) {
            debugPrint("yolo error");
            debugPrint(state.message);
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ReportLoading) {
            return const Loader();
          }
          if (state is ReportGetAllSuccess) {
            return ListView.builder(
              itemCount: state.reports.length,
              itemBuilder: (context, index) {
                final report = state.reports[index];
                return ReportCard(report: report);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
