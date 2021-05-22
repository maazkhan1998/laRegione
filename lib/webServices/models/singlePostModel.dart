class SinglePost {
  Data data;

  SinglePost({this.data});

  SinglePost.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
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
  String featuredImageCaption;
  String readTime;
  bool featured;
  bool isFavorited;
  String topicStyle;
  Url url;
  Publisher publisher;
  Topic topic;
  List<Tags> tags;
  String createdAt;
  String updatedAt;
  String publishedAt;
  String publishedDate;

  Data(
      {this.id,
      this.title,
      this.summary,
      this.body,
      this.slug,
      this.featuredImage,
      this.featuredImageCaption,
      this.readTime,
      this.featured,
      this.isFavorited,
      this.topicStyle,
      this.url,
      this.publisher,
      this.topic,
      this.tags,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.publishedDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    body = json['body'];
    slug = json['slug'];
    featuredImage = json['featured_image'];
    featuredImageCaption = json['featured_image_caption'];
    readTime = json['read_time'];
    featured = json['featured'];
    isFavorited = json['is_favorited'];
    topicStyle = json['topic_style'];
    url = json['url'] != null ? new Url.fromJson(json['url']) : null;
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
    publishedDate = json['published_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['body'] = this.body;
    data['slug'] = this.slug;
    data['featured_image'] = this.featuredImage;
    data['featured_image_caption'] = this.featuredImageCaption;
    data['read_time'] = this.readTime;
    data['featured'] = this.featured;
    data['is_favorited'] = this.isFavorited;
    data['topic_style'] = this.topicStyle;
    if (this.url != null) {
      data['url'] = this.url.toJson();
    }
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
    data['published_date'] = this.publishedDate;
    return data;
  }
}

class Url {
  String name;
  Params params;

  Url({this.name, this.params});

  Url.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.params != null) {
      data['params'] = this.params.toJson();
    }
    return data;
  }
}

class Params {
  String topic;
  String subtopic;
  String slug;

  Params({this.topic, this.subtopic, this.slug});

  Params.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    subtopic = json['subtopic'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic'] = this.topic;
    data['subtopic'] = this.subtopic;
    data['slug'] = this.slug;
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
  String about;
  Null darkMode;
  bool featured;
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
  bool featured;
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
  bool featured;
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
  int featured;
  String created;
  String updated;

  Tags(
      {this.id,
      this.slug,
      this.name,
      this.postsCount,
      this.featured,
      this.created,
      this.updated});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    postsCount = json['posts_count'];
    featured = json['featured'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['posts_count'] = this.postsCount;
    data['featured'] = this.featured;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}