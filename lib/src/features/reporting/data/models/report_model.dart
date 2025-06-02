import 'package:smart_city/src/features/reporting/domain/entities/report.dart';

class ReportModel extends Report {
  const ReportModel(
      {required super.reportId,
      required super.description,
      required super.dateCreation,
      required super.statusId,
      required super.userId,
      required super.categoryId,
      super.image});

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      reportId: json['report_id'],
      description: json['description'],
      dateCreation: DateTime.parse(json['date_creation']),
      statusId: json['status_id'],
      userId: json['user_id'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'report_id': reportId,
      'description': description,
      'date_creation': dateCreation.toIso8601String(),
      'status_id': statusId,
      'user_id': userId,
      'category_id': categoryId,
    };
  }

  ReportModel copyWith(
      {String? reportId,
      String? description,
      DateTime? dateCreation,
      String? statusId,
      String? userId,
      String? categoryId,
      String? image}) {
    return ReportModel(
        reportId: reportId ?? this.reportId,
        description: description ?? this.description,
        dateCreation: dateCreation ?? this.dateCreation,
        statusId: statusId ?? this.statusId,
        userId: userId ?? this.userId,
        categoryId: categoryId ?? this.categoryId,
        image: image ?? this.image);
  }
}
