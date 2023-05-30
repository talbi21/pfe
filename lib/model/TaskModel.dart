class Task {
  final String id;
  final String title;
  final String date;
  final String description;
  final String status;
  final String type;
  final List<String> collaborators;
  final Map<String, dynamic>? attachment;
  final bool isArchived;
  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.status,
    required this.type,
    required this.collaborators,
    this.attachment,
    required this.isArchived,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['_id'],
      title: json['title'],
      date: json['date'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      collaborators: List<String>.from(
          json['collaborators']), // Handle null values with default value
      attachment: json['attachment'],
      isArchived: json['isArchived'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'date': date,
      'description': description,
      'status': status,
      'type': type,
      'collaborators': collaborators,
      'attachment': attachment, // Convert file object to string path
      'isArchived': isArchived,
    };
  }
}
