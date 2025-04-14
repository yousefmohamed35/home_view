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
    title: json['data']['title'],
    description: json['data']['description'],
    location: json['data']['location'],
    jobType: json['data']['jobType'],
  );
}
