
class UserProfileModal{
  int id;
  String email;
  String login;
  String firstName;
  String lastName;
  

  UserProfileModal(
      {this.id,
        this.email,
        this.login,
        this.firstName,
        this.lastName,});

  UserProfileModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    login = json['login'];
    firstName = json['first_name'];
    lastName = json['last_name'];

    

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['login'] = this.login;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class CursusUsers {
  String grade;
  double level;
  List<Skills> skills;
  Null blackholedAt;
  int id;
  String beginAt;
  String endAt;
  int cursusId;
  bool hasCoalition;
  User user;
  Cursus cursus;

  CursusUsers(
      {this.grade,
        this.level,
        this.skills,
        this.blackholedAt,
        this.id,
        this.beginAt,
        this.endAt,
        this.cursusId,
        this.hasCoalition,
        this.user,
        this.cursus});

  CursusUsers.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    level = json['level'];
    if (json['skills'] != null) {
      skills = new List<Skills>();
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    blackholedAt = json['blackholed_at'];
    id = json['id'];
    beginAt = json['begin_at'];
    endAt = json['end_at'];
    cursusId = json['cursus_id'];
    hasCoalition = json['has_coalition'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cursus =
    json['cursus'] != null ? new Cursus.fromJson(json['cursus']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    data['level'] = this.level;
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    data['blackholed_at'] = this.blackholedAt;
    data['id'] = this.id;
    data['begin_at'] = this.beginAt;
    data['end_at'] = this.endAt;
    data['cursus_id'] = this.cursusId;
    data['has_coalition'] = this.hasCoalition;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.cursus != null) {
      data['cursus'] = this.cursus.toJson();
    }
    return data;
  }
}

class Skills {
  int id;
  String name;
  double level;

  Skills({this.id, this.name, this.level});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['level'] = this.level;
    return data;
  }
}

class User {
  int id;
  String login;
  String url;

  User({this.id, this.login, this.url});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['url'] = this.url;
    return data;
  }
}

class Cursus {
  int id;
  String createdAt;
  String name;
  String slug;

  Cursus({this.id, this.createdAt, this.name, this.slug});

  Cursus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class ProjectsUsers {
  int id;
  int occurrence;
  int finalMark;
  String status;
  bool validated;
  int currentTeamId;
  Project project;
  List<int> cursusIds;
  String markedAt;
  bool marked;
  String retriableAt;

  ProjectsUsers(
      {this.id,
        this.occurrence,
        this.finalMark,
        this.status,
        this.validated,
        this.currentTeamId,
        this.project,
        this.cursusIds,
        this.markedAt,
        this.marked,
        this.retriableAt});

  ProjectsUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    occurrence = json['occurrence'];
    finalMark = json['final_mark'];
    status = json['status'];
    validated = json['validated?'];
    currentTeamId = json['current_team_id'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    cursusIds = json['cursus_ids'].cast<int>();
    markedAt = json['marked_at'];
    marked = json['marked'];
    retriableAt = json['retriable_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['occurrence'] = this.occurrence;
    data['final_mark'] = this.finalMark;
    data['status'] = this.status;
    data['validated?'] = this.validated;
    data['current_team_id'] = this.currentTeamId;
    if (this.project != null) {
      data['project'] = this.project.toJson();
    }
    data['cursus_ids'] = this.cursusIds;
    data['marked_at'] = this.markedAt;
    data['marked'] = this.marked;
    data['retriable_at'] = this.retriableAt;
    return data;
  }
}

class Project {
  int id;
  String name;
  String slug;
  int parentId;

  Project({this.id, this.name, this.slug, this.parentId});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class LanguagesUsers {
  int id;
  int languageId;
  int userId;
  int position;
  String createdAt;

  LanguagesUsers(
      {this.id, this.languageId, this.userId, this.position, this.createdAt});

  LanguagesUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageId = json['language_id'];
    userId = json['user_id'];
    position = json['position'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_id'] = this.languageId;
    data['user_id'] = this.userId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Achievements {
  int id;
  String name;
  String description;
  String tier;
  String kind;
  bool visible;
  String image;
  int nbrOfSuccess;
  String usersUrl;

  Achievements(
      {this.id,
        this.name,
        this.description,
        this.tier,
        this.kind,
        this.visible,
        this.image,
        this.nbrOfSuccess,
        this.usersUrl});

  Achievements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    tier = json['tier'];
    kind = json['kind'];
    visible = json['visible'];
    image = json['image'];
    nbrOfSuccess = json['nbr_of_success'];
    usersUrl = json['users_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['tier'] = this.tier;
    data['kind'] = this.kind;
    data['visible'] = this.visible;
    data['image'] = this.image;
    data['nbr_of_success'] = this.nbrOfSuccess;
    data['users_url'] = this.usersUrl;
    return data;
  }
}

class ExpertisesUsers {
  int id;
  int expertiseId;
  bool interested;
  int value;
  bool contactMe;
  String createdAt;
  int userId;

  ExpertisesUsers(
      {this.id,
        this.expertiseId,
        this.interested,
        this.value,
        this.contactMe,
        this.createdAt,
        this.userId});

  ExpertisesUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expertiseId = json['expertise_id'];
    interested = json['interested'];
    value = json['value'];
    contactMe = json['contact_me'];
    createdAt = json['created_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expertise_id'] = this.expertiseId;
    data['interested'] = this.interested;
    data['value'] = this.value;
    data['contact_me'] = this.contactMe;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    return data;
  }
}

class Campus {
  int id;
  String name;
  String timeZone;
  Language language;
  int usersCount;
  int vogsphereId;
  String country;
  String address;
  String zip;
  String city;
  String website;
  String facebook;
  String twitter;
  bool active;
  String emailExtension;

  Campus(
      {this.id,
        this.name,
        this.timeZone,
        this.language,
        this.usersCount,
        this.vogsphereId,
        this.country,
        this.address,
        this.zip,
        this.city,
        this.website,
        this.facebook,
        this.twitter,
        this.active,
        this.emailExtension});

  Campus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    timeZone = json['time_zone'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    usersCount = json['users_count'];
    vogsphereId = json['vogsphere_id'];
    country = json['country'];
    address = json['address'];
    zip = json['zip'];
    city = json['city'];
    website = json['website'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    active = json['active'];
    emailExtension = json['email_extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time_zone'] = this.timeZone;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['users_count'] = this.usersCount;
    data['vogsphere_id'] = this.vogsphereId;
    data['country'] = this.country;
    data['address'] = this.address;
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['active'] = this.active;
    data['email_extension'] = this.emailExtension;
    return data;
  }
}

class Language {
  int id;
  String name;
  String identifier;
  String createdAt;
  String updatedAt;

  Language(
      {this.id, this.name, this.identifier, this.createdAt, this.updatedAt});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    identifier = json['identifier'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['identifier'] = this.identifier;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CampusUsers {
  int id;
  int userId;
  int campusId;
  bool isPrimary;

  CampusUsers({this.id, this.userId, this.campusId, this.isPrimary});

  CampusUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    campusId = json['campus_id'];
    isPrimary = json['is_primary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['campus_id'] = this.campusId;
    data['is_primary'] = this.isPrimary;
    return data;
  }
}
