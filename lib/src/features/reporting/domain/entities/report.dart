class Report {
  final String reportId;
  final String description;
  final DateTime dateCreation;
  final String statusId;
  final String userId;
  final String categoryId;
  final String? image;

  const Report(
      {required this.reportId,
      required this.description,
      required this.dateCreation,
      required this.statusId,
      required this.userId,
      required this.categoryId,
      this.image});
}
