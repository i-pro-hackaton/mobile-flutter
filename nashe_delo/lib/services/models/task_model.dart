class TaskModel {
  final int id;
  final String name;
  final String description;
  final String taskType;
  final String imageUrl;
  final int companyId;
  final int ownerId;
  final DateTime startDate;
  final DateTime endDate;
  bool isFavorite = false;

  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    required this.taskType,
    required this.imageUrl,
    required this.companyId,
    required this.ownerId,
    required this.startDate,
    required this.endDate,
    this.isFavorite = false
});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      taskType: json['task_type'],
      imageUrl: json['image_url'],
      companyId: json['company_id'],
      ownerId: json['owner_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date'])
  );
}