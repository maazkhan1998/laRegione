class LoginResponse {
  Data data;
  Meta meta;

  LoginResponse({this.data, this.meta});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String firstName;
  String lastName;
  String username;
  String email;
  String initials;
  String avatar;
  Null about;
  Null darkMode;
  Null role;
  String created;
  String updated;

  Data(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.initials,
      this.avatar,
      this.about,
      this.darkMode,
      this.role,
      this.created,
      this.updated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    initials = json['initials'];
    avatar = json['avatar'];
    about = json['about'];
    darkMode = json['dark_mode'];
    role = json['role'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['initials'] = this.initials;
    data['avatar'] = this.avatar;
    data['about'] = this.about;
    data['dark_mode'] = this.darkMode;
    data['role'] = this.role;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Meta {
  String token;
  int expiresIn;

  Meta({this.token, this.expiresIn});

  Meta.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiresIn'] = this.expiresIn;
    return data;
  }
}