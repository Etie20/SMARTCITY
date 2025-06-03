import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/src/core/constants/constants.dart';
import 'package:smart_city/src/core/constants/path_constants.dart';
import 'package:smart_city/src/core/theme/app_pallete.dart';
import 'package:smart_city/src/features/reporting/domain/entities/report.dart';
import 'package:smart_city/src/features/reporting/presentation/pages/report_viewer_page.dart';

class ReportCard extends StatelessWidget {
  final Report report;
  const ReportCard({
    super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        ReportViewerPage.route(report),
      ),
      child: CachedNetworkImage(
        imageUrl: report.image ?? "https://ferqujwgbgeaaqimloqq.supabase.co/storage/v1/object/sign/report_images/9cd48f60-4076-11f0-b228-bd432883dd35?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV80ZTU3YWU1MC1jYzQ4LTQ1MTUtOGQyNi0wZGZmZTM0OTVhNTAiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZXBvcnRfaW1hZ2VzLzljZDQ4ZjYwLTQwNzYtMTFmMC1iMjI4LWJkNDMyODgzZGQzNSIsImlhdCI6MTc0ODk1NTI4OCwiZXhwIjoxNzQ5NTYwMDg4fQ.0wJ5yLKwcngxMiVF7ah7JAKlnY3qZcGOPeGQrGvM1NQ",
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        imageBuilder: (context, imageProvider) => IntrinsicHeight(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 270,
            ),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                opacity: .223,
              ),
              color: AppPallete.blogCardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: AppPallete.blogCardRadiusColor,
                  blurStyle: BlurStyle.inner,
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  report.reportId,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: blog.topics
                //         .map(
                //           (e) => Padding(
                //             padding: const EdgeInsets.only(right: 5),
                //             child: Chip(
                //               label: Text(
                //                 e,
                //                 style: const TextStyle(fontSize: 10),
                //               ),
                //             ),
                //           ),
                //         )
                //         .toList(),
                //   ),
                // ),
                const Spacer(),
                Text(report.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,),
                const SizedBox(height: 30),
                const Spacer(),
                // Row(
                //   children: [
                //     Text(
                //       '${calculateReadingTime(blog.content)} min',
                //       style: const TextStyle(
                //           fontWeight: FontWeight.w400, fontSize: 10),
                //     ),
                //     const Spacer(),
                //     RichText(
                //       text: TextSpan(
                //         text: 'By ',
                //         style: const TextStyle(
                //           fontWeight: FontWeight.w300,
                //         ),
                //         children: [
                //           TextSpan(
                //             text: blog.posterName ?? '..........',
                //             style: const TextStyle(fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
