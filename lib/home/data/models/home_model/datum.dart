class Datum {
final  String id;
final  String companyId;
final  String companyName;
final  String title;
final  String description;
final  String location;
final  DateTime postedOn;
final  int salaryTypeId;
final  int salary;
final  int jobTypeTd;


  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    companyId: json['companyId'] ,
    companyName: json['companyName'] ,
    title: json['title'] ,
    description: json['description'] ,
    location: json['location'] ,
    postedOn: DateTime.parse(json['postedOn'] as String),
    salaryTypeId: json['salaryTypeId'] ,
    salary: json['salary'] ,
    jobTypeTd: json['jobTypeTd'],
  );

  Datum({required this.id, required this.companyId, required this.companyName, required this.title, required this.description, required this.location, required this.postedOn, required this.salaryTypeId, required this.salary, required this.jobTypeTd});

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
