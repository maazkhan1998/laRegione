class TopicPost {
  List<Data> data;

  TopicPost({this.data});

  TopicPost.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String title;
  String summary;
  String body;
  String slug;
  String featuredImage;
  String readTime;
  bool featured;
  bool isFavorited;
  Publisher publisher;
  Topic topic;
  List<Tags> tags;
  String createdAt;
  String updatedAt;
  String publishedAt;

  Data(
      {this.id,
      this.title,
      this.summary,
      this.body,
      this.slug,
      this.featuredImage,
      this.readTime,
      this.featured,
      this.isFavorited,
      this.publisher,
      this.topic,
      this.tags,
      this.createdAt,
      this.updatedAt,
      this.publishedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    body = json['body'];
    slug = json['slug'];
    featuredImage = json['featured_image'];
    readTime = json['read_time'];
    featured = json['featured'];
    isFavorited = json['is_favorited'];
    publisher = json['publisher'] != null
        ? new Publisher.fromJson(json['publisher'])
        : null;
    topic = json['topic'] != null ? new Topic.fromJson(json['topic']) : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['body'] = this.body;
    data['slug'] = this.slug;
    data['featured_image'] = this.featuredImage;
    data['read_time'] = this.readTime;
    data['featured'] = this.featured;
    data['is_favorited'] = this.isFavorited;
    if (this.publisher != null) {
      data['publisher'] = this.publisher.toJson();
    }
    if (this.topic != null) {
      data['topic'] = this.topic.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['published_at'] = this.publishedAt;
    return data;
  }
}

class Publisher {
  int id;
  String name;
  String firstName;
  String lastName;
  String username;
  String initials;
  String avatar;
  Null about;
  Null darkMode;
  int featured;
  bool isFollowed;
  String created;
  String updated;

  Publisher(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.username,
      this.initials,
      this.avatar,
      this.about,
      this.darkMode,
      this.featured,
      this.isFollowed,
      this.created,
      this.updated});

  Publisher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    initials = json['initials'];
    avatar = json['avatar'];
    about = json['about'];
    darkMode = json['dark_mode'];
    featured = json['featured'];
    isFollowed = json['is_followed'];
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
    data['initials'] = this.initials;
    data['avatar'] = this.avatar;
    data['about'] = this.about;
    data['dark_mode'] = this.darkMode;
    data['featured'] = this.featured;
    data['is_followed'] = this.isFollowed;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Topic {
  int id;
  String slug;
  String name;
  String description;
  String style;
  bool visible;
  int ordering;
  int featured;
  bool isSubscribed;
  Parent parent;
  String created;
  String updated;

  Topic(
      {this.id,
      this.slug,
      this.name,
      this.description,
      this.style,
      this.visible,
      this.ordering,
      this.featured,
      this.isSubscribed,
      this.parent,
      this.created,
      this.updated});

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    description = json['description'];
    style = json['style'];
    visible = json['visible'];
    ordering = json['ordering'];
    featured = json['featured'];
    isSubscribed = json['is_subscribed'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['description'] = this.description;
    data['style'] = this.style;
    data['visible'] = this.visible;
    data['ordering'] = this.ordering;
    data['featured'] = this.featured;
    data['is_subscribed'] = this.isSubscribed;
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
    }
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Parent {
  int id;
  String slug;
  String name;
  String description;
  String style;
  bool visible;
  int ordering;
  int featured;
  bool isSubscribed;
  String created;
  String updated;

  Parent(
      {this.id,
      this.slug,
      this.name,
      this.description,
      this.style,
      this.visible,
      this.ordering,
      this.featured,
      this.isSubscribed,
      this.created,
      this.updated});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    description = json['description'];
    style = json['style'];
    visible = json['visible'];
    ordering = json['ordering'];
    featured = json['featured'];
    isSubscribed = json['is_subscribed'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['description'] = this.description;
    data['style'] = this.style;
    data['visible'] = this.visible;
    data['ordering'] = this.ordering;
    data['featured'] = this.featured;
    data['is_subscribed'] = this.isSubscribed;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}

class Tags {
  int id;
  String slug;
  String name;
  Null postsCount;
  String created;
  String updated;

  Tags(
      {this.id,
      this.slug,
      this.name,
      this.postsCount,
      this.created,
      this.updated});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    postsCount = json['posts_count'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['posts_count'] = this.postsCount;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}