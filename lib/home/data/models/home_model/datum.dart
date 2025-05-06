import '../../enums/job_type.dart';
import '../../enums/salary_type.dart';
import '../../extension/job_type_extension.dart';
import '../../extension/salary_type_extension.dart';

class Datum {
  final String id;
  final String companyId;
  final String companyName;
  final String title;
  final String description;
  final String location;
  final DateTime postedOn;
  final SalaryType salaryTypeId;
  final double salary;
  final JobType jobTypeTd;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    companyId: json['companyId'],
    companyName: json['companyName'],
    title: json['title'],
    description: json['description'],
    location: json['location'],
    postedOn: DateTime.parse(json['postedOn'] as String),
    salaryTypeId: SalaryTypeExtension.fromId(json['salaryTypeId']),
    salary: json['salary'],
    jobTypeTd: JobTypeExtension.fromId(json['jobTypeTd']),
  );

  Datum({
    required this.id,
    required this.companyId,
    required this.companyName,
    required this.title,
    required this.description,
    required this.location,
    required this.postedOn,
    required this.salaryTypeId,
    required this.salary,
    required this.jobTypeTd,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'companyId': companyId,
    'companyName': companyName,
    'title': title,
    'description': description,
    'location': location,
    'postedOn': postedOn.toIso8601String(),
    'salaryTypeId': salaryTypeId,
    'salary': salary,
    'jobTypeTd': jobTypeTd,
  };
}
