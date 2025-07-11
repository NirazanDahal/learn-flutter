class UserAPIModel {
  bool? success;
  String? message;
  List<Cv>? cv;

  UserAPIModel({this.success, this.message, this.cv});

  factory UserAPIModel.fromJson(Map<String, dynamic> json) {
    return UserAPIModel(
      success: json['success'],
      message: json['message'],
      cv: List<Cv>.from(json['cv'].map((e) => Cv.fromJson(e))),
    );
  }
  Map<String, dynamic> toJson() {
    return {'cv': cv?.map((e) => e.toJson())};
  }
}

class Cv {
  PersonalInfo? personalInfo;
  String? sId;
  UserId? userId;
  List<Education>? education;
  List<Experience>? experience;
  List<String>? skills;
  List<Projects>? projects;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Cv({
    this.personalInfo,
    this.sId,
    this.userId,
    this.education,
    this.experience,
    this.skills,
    this.projects,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory Cv.fromJson(Map<String, dynamic> json) {
    return Cv(
      personalInfo: json['personalInfo'] != null
          ? PersonalInfo.fromJson(json['personalInfo'])
          : null,
      sId: json['sId'],
      userId: json['userId'] != null ? UserId.fromJson(json['userId']) : null,
      education: json['education'] != null
          ? List<Education>.from(
              json['education'].map((e) => Education.fromJson(e)),
            )
          : null,
      experience: json['experience'] != null
          ? List<Experience>.from(
              json['experience'].map((e) => Experience.fromJson(e)),
            )
          : null,
      skills: json['skills'] != null
          ? List<String>.from(json['skills'].map((e) => e.toString()))
          : null,

      projects: json['projects'] != null
          ? List<Projects>.from(
              json['projects'].map((e) => Projects.fromJson(e)),
            )
          : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['iV'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personalInfo': personalInfo?.toJson(),
      'sId': sId,
      'userId': userId?.toJson(),
      'education': education?.map((e) => e.toJson()),
      'experience': experience?.map((e) => e.toJson()),
      'skills': skills,
      'projects': projects?.map((e) => e.toJson()),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'iV': iV,
    };
  }
}

class PersonalInfo {
  String? name;
  String? email;
  String? phone;
  String? summary;

  PersonalInfo({this.name, this.email, this.phone, this.summary});

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'phone': phone, 'summary': summary};
  }
}

class UserId {
  String? sId;
  String? name;
  String? email;

  UserId({this.sId, this.name, this.email});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(sId: json['sId'], name: json['name'], email: json['email']);
  }
  Map<String, dynamic> toJson() {
    return {'sId': sId, 'name': name, 'email': email};
  }
}

class Education {
  String? degree;
  String? institution;
  String? startDate;
  String? endDate;
  String? description;
  String? sId;

  Education({
    this.degree,
    this.institution,
    this.startDate,
    this.endDate,
    this.description,
    this.sId,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'],
      institution: json['institution'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
      sId: json['sId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'degree': degree,
      'institution': institution,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'sId': sId,
    };
  }
}

class Experience {
  String? title;
  String? company;
  String? startDate;
  String? endDate;
  String? description;
  String? sId;

  Experience({
    this.title,
    this.company,
    this.startDate,
    this.endDate,
    this.description,
    this.sId,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      company: json['company'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      description: json['description'],
      sId: json['sId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company': company,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'sId': sId,
    };
  }
}

class Projects {
  String? name;
  String? description;
  List<String>? technologies;
  String? sId;

  Projects({this.name, this.description, this.technologies, this.sId});

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      name: json['name'],
      description: json['description'],
      technologies: json['technologies'] != null
          ? List<String>.from(json['technologies'].map((e) => e.toString()))
          : null,

      sId: json['sId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'technologies': technologies,
      'sId': sId,
    };
  }
}
