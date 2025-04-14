class HomeModel {
  final String title;
  final String description;
  final String location;
  final String jobType;

  HomeModel({
    required this.title,
    required this.description,
    required this.location,
    required this.jobType,
  });
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    title: json['title'],
    description: json['description'],
    location: json['location'],
    jobType: json['jobType'],
  );
}
