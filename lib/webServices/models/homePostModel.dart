// To parse this JSON data, do
//
//     final homePost = homePostFromJson(jsonString);

import 'dart:convert';

HomePost homePostFromJson(String str) => HomePost.fromJson(json.decode(str));

String homePostToJson(HomePost data) => json.encode(data.toJson());

class HomePost {
    HomePost({
        this.data,
    });

    Data data;

    factory HomePost.fromJson(Map<String, dynamic> json) => HomePost(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.articles,
        this.topics,
        this.publishers,
        this.tags,
    });

    List<Article> articles;
    Topics topics;
    Publishers publishers;
    List<Article> tags;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
        topics: Topics.fromJson(json["topics"]),
        publishers: Publishers.fromJson(json["publishers"]),
        tags: List<Article>.from(json["tags"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
        "topics": topics.toJson(),
        "publishers": publishers.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.id,
        this.title,
        this.summary,
        this.body,
        this.slug,
        this.featuredImage,
        this.featuredImageCaption,
        this.featuredImageSizes,
        this.readTime,
        this.featured,
        this.isPremium,
        this.postType,
        this.isFavorited,
        this.topicStyle,
        this.url,
        this.publisher,
        this.topic,
        this.tags,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.publishedDate,
    });

    int id;
    String title;
    String summary;
    String body;
    String slug;
    String featuredImage;
    String featuredImageCaption;
    FeaturedImageSizes featuredImageSizes;
    ReadTime readTime;
    bool featured;
    bool isPremium;
    int postType;
    bool isFavorited;
    Style topicStyle;
    ArticleUrl url;
    Publisher publisher;
    Topic topic;
    List<Tag> tags;
    EdAt createdAt;
    EdAt updatedAt;
    EdAt publishedAt;
    PublishedDate publishedDate;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        summary: json["summary"],
        body: json["body"],
        slug: json["slug"],
        featuredImage: json["featured_image"],
        featuredImageCaption: json["featured_image_caption"],
        featuredImageSizes: FeaturedImageSizes.fromJson(json["featured_image_sizes"]),
        readTime: readTimeValues.map[json["read_time"]],
        featured: json["featured"],
        isPremium: json["is_premium"],
        postType: json["post_type"],
        isFavorited: json["is_favorited"],
        topicStyle: styleValues.map[json["topic_style"]],
        url: ArticleUrl.fromJson(json["url"]),
        publisher: Publisher.fromJson(json["publisher"]),
        topic: Topic.fromJson(json["topic"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        createdAt: edAtValues.map[json["created_at"]],
        updatedAt: edAtValues.map[json["updated_at"]],
        publishedAt: edAtValues.map[json["published_at"]],
        publishedDate: publishedDateValues.map[json["published_date"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "summary": summary,
        "body": body,
        "slug": slug,
        "featured_image": featuredImage,
        "featured_image_caption": featuredImageCaption,
        "featured_image_sizes": featuredImageSizes.toJson(),
        "read_time": readTimeValues.reverse[readTime],
        "featured": featured,
        "is_premium": isPremium,
        "post_type": postType,
        "is_favorited": isFavorited,
        "topic_style": styleValues.reverse[topicStyle],
        "url": url.toJson(),
        "publisher": publisher.toJson(),
        "topic": topic.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "created_at": edAtValues.reverse[createdAt],
        "updated_at": edAtValues.reverse[updatedAt],
        "published_at": edAtValues.reverse[publishedAt],
        "published_date": publishedDateValues.reverse[publishedDate],
    };
}

enum EdAt { THE_5_HOURS_AGO }

final edAtValues = EnumValues({
    "5 hours ago": EdAt.THE_5_HOURS_AGO
});

class FeaturedImageSizes {
    FeaturedImageSizes({
        this.sm,
        this.md,
        this.lg,
    });

    String sm;
    String md;
    String lg;

    factory FeaturedImageSizes.fromJson(Map<String, dynamic> json) => FeaturedImageSizes(
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
    );

    Map<String, dynamic> toJson() => {
        "sm": sm,
        "md": md,
        "lg": lg,
    };
}

enum PublishedDate { SUNDAY_23_RD_OF_MAY_2021163757, SUNDAY_23_RD_OF_MAY_2021163758 }

final publishedDateValues = EnumValues({
    "Sunday 23rd of May 2021 16:37:57": PublishedDate.SUNDAY_23_RD_OF_MAY_2021163757,
    "Sunday 23rd of May 2021 16:37:58": PublishedDate.SUNDAY_23_RD_OF_MAY_2021163758
});

class Publisher {
    Publisher({
        this.id,
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
        this.updated,
    });

    int id;
    String name;
    String firstName;
    String lastName;
    String username;
    String initials;
    String avatar;
    String about;
    dynamic darkMode;
    bool featured;
    bool isFollowed;
    Ated created;
    Ated updated;

    factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        initials: json["initials"],
        avatar: json["avatar"],
        about: json["about"],
        darkMode: json["dark_mode"],
        featured: json["featured"],
        isFollowed: json["is_followed"],
        created: atedValues.map[json["created"]],
        updated: atedValues.map[json["updated"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "initials": initials,
        "avatar": avatar,
        "about": about,
        "dark_mode": darkMode,
        "featured": featured,
        "is_followed": isFollowed,
        "created": atedValues.reverse[created],
        "updated": atedValues.reverse[updated],
    };
}

enum Ated { THE_3_WEEKS_AGO, THE_1_WEEK_AGO }

final atedValues = EnumValues({
    "1 week ago": Ated.THE_1_WEEK_AGO,
    "3 weeks ago": Ated.THE_3_WEEKS_AGO
});

enum ReadTime { THE_1_MIN_READ }

final readTimeValues = EnumValues({
    "1 min read": ReadTime.THE_1_MIN_READ
});

class Tag {
    Tag({
        this.id,
        this.slug,
        this.name,
        this.postsCount,
        this.featured,
        this.created,
        this.updated,
    });

    int id;
    String slug;
    String name;
    dynamic postsCount;
    int featured;
    Ated created;
    Ated updated;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        postsCount: json["posts_count"],
        featured: json["featured"],
        created: atedValues.map[json["created"]],
        updated: atedValues.map[json["updated"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "posts_count": postsCount,
        "featured": featured,
        "created": atedValues.reverse[created],
        "updated": atedValues.reverse[updated],
    };
}

class Topic {
    Topic({
        this.id,
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
        this.updated,
    });

    int id;
    String slug;
    String name;
    String description;
    Style style;
    bool visible;
    int ordering;
    bool featured;
    bool isSubscribed;
    Topic parent;
    Ated created;
    Ated updated;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        style: styleValues.map[json["style"]],
        visible: json["visible"],
        ordering: json["ordering"],
        featured: json["featured"],
        isSubscribed: json["is_subscribed"],
        parent: json["parent"] == null ? null : Topic.fromJson(json["parent"]),
        created: atedValues.map[json["created"]],
        updated: atedValues.map[json["updated"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "description": description,
        "style": styleValues.reverse[style],
        "visible": visible,
        "ordering": ordering,
        "featured": featured,
        "is_subscribed": isSubscribed,
        "parent": parent == null ? null : parent.toJson(),
        "created": atedValues.reverse[created],
        "updated": atedValues.reverse[updated],
    };
}

enum Style { BG_LIME_10_TEXT_WHITE, BG_YELLOW_10_TEXT_WHITE, BG_BLUE_TEXT_WHITE, BG_INDIGO_TEXT_WHITE, BG_PURPLE_TEXT_WHITE, BG_RED_TEXT_WHITE, BG_GREEN_TEXT_WHITE, BG_ORANGE_10_TEXT_WHITE }

final styleValues = EnumValues({
    "bg-blue text-white": Style.BG_BLUE_TEXT_WHITE,
    "bg-green text-white": Style.BG_GREEN_TEXT_WHITE,
    "bg-indigo text-white": Style.BG_INDIGO_TEXT_WHITE,
    "bg-lime-10 text-white": Style.BG_LIME_10_TEXT_WHITE,
    "bg-orange-10 text-white": Style.BG_ORANGE_10_TEXT_WHITE,
    "bg-purple text-white": Style.BG_PURPLE_TEXT_WHITE,
    "bg-red text-white": Style.BG_RED_TEXT_WHITE,
    "bg-yellow-10 text-white": Style.BG_YELLOW_10_TEXT_WHITE
});

class ArticleUrl {
    ArticleUrl({
        this.name,
        this.params,
    });

    Name name;
    PurpleParams params;

    factory ArticleUrl.fromJson(Map<String, dynamic> json) => ArticleUrl(
        name: nameValues.map[json["name"]],
        params: PurpleParams.fromJson(json["params"]),
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "params": params.toJson(),
    };
}

enum Name { POST_SHOW }

final nameValues = EnumValues({
    "post-show": Name.POST_SHOW
});

class PurpleParams {
    PurpleParams({
        this.topic,
        this.subtopic,
        this.slug,
    });

    String topic;
    String subtopic;
    String slug;

    factory PurpleParams.fromJson(Map<String, dynamic> json) => PurpleParams(
        topic: json["topic"],
        subtopic: json["subtopic"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "topic": topic,
        "subtopic": subtopic,
        "slug": slug,
    };
}

class Publishers {
    Publishers({
        this.rubieJenkins,
        this.moseRenner,
        this.fidelCorkery,
    });

    List<Article> rubieJenkins;
    List<Article> moseRenner;
    List<Article> fidelCorkery;

    factory Publishers.fromJson(Map<String, dynamic> json) => Publishers(
        rubieJenkins: List<Article>.from(json["Rubie Jenkins"].map((x) => Article.fromJson(x))),
        moseRenner: List<Article>.from(json["Mose Renner"].map((x) => Article.fromJson(x))),
        fidelCorkery: List<Article>.from(json["Fidel Corkery"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Rubie Jenkins": List<dynamic>.from(rubieJenkins.map((x) => x.toJson())),
        "Mose Renner": List<dynamic>.from(moseRenner.map((x) => x.toJson())),
        "Fidel Corkery": List<dynamic>.from(fidelCorkery.map((x) => x.toJson())),
    };
}

class Topics {
    Topics({
        this.eaque,
        this.nihil,
        this.velit,
        this.officiis,
        this.id,
        this.qui,
        this.eum,
        this.eius,
        this.ut,
        this.eos,
    });

    List<Eaque> eaque;
    List<Eaque> nihil;
    List<Eaque> velit;
    List<Eaque> officiis;
    List<Eaque> id;
    List<Eaque> qui;
    List<Eaque> eum;
    List<Eaque> eius;
    List<Eaque> ut;
    List<Eaque> eos;

    factory Topics.fromJson(Map<String, dynamic> json) => Topics(
        eaque: List<Eaque>.from(json["Eaque"].map((x) => Eaque.fromJson(x))),
        nihil: List<Eaque>.from(json["Nihil"].map((x) => Eaque.fromJson(x))),
        velit: List<Eaque>.from(json["Velit"].map((x) => Eaque.fromJson(x))),
        officiis: List<Eaque>.from(json["Officiis"].map((x) => Eaque.fromJson(x))),
        id: List<Eaque>.from(json["Id"].map((x) => Eaque.fromJson(x))),
        qui: List<Eaque>.from(json["Qui"].map((x) => Eaque.fromJson(x))),
        eum: List<Eaque>.from(json["Eum"].map((x) => Eaque.fromJson(x))),
        eius: List<Eaque>.from(json["Eius"].map((x) => Eaque.fromJson(x))),
        ut: List<Eaque>.from(json["Ut"].map((x) => Eaque.fromJson(x))),
        eos: List<Eaque>.from(json["Eos"].map((x) => Eaque.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Eaque": List<dynamic>.from(eaque.map((x) => x.toJson())),
        "Nihil": List<dynamic>.from(nihil.map((x) => x.toJson())),
        "Velit": List<dynamic>.from(velit.map((x) => x.toJson())),
        "Officiis": List<dynamic>.from(officiis.map((x) => x.toJson())),
        "Id": List<dynamic>.from(id.map((x) => x.toJson())),
        "Qui": List<dynamic>.from(qui.map((x) => x.toJson())),
        "Eum": List<dynamic>.from(eum.map((x) => x.toJson())),
        "Eius": List<dynamic>.from(eius.map((x) => x.toJson())),
        "Ut": List<dynamic>.from(ut.map((x) => x.toJson())),
        "Eos": List<dynamic>.from(eos.map((x) => x.toJson())),
    };
}

class Eaque {
    Eaque({
        this.id,
        this.title,
        this.summary,
        this.body,
        this.slug,
        this.featuredImage,
        this.featuredImageCaption,
        this.featuredImageSizes,
        this.readTime,
        this.featured,
        this.isPremium,
        this.postType,
        this.isFavorited,
        this.topicStyle,
        this.url,
        this.publisher,
        this.topic,
        this.tags,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.publishedDate,
    });

    int id;
    String title;
    String summary;
    String body;
    String slug;
    String featuredImage;
    String featuredImageCaption;
    FeaturedImageSizes featuredImageSizes;
    ReadTime readTime;
    bool featured;
    bool isPremium;
    int postType;
    bool isFavorited;
    Style topicStyle;
    EaqueUrl url;
    Publisher publisher;
    Topic topic;
    List<Tag> tags;
    EdAt createdAt;
    EdAt updatedAt;
    EdAt publishedAt;
    PublishedDate publishedDate;

    factory Eaque.fromJson(Map<String, dynamic> json) => Eaque(
        id: json["id"],
        title: json["title"],
        summary: json["summary"],
        body: json["body"],
        slug: json["slug"],
        featuredImage: json["featured_image"],
        featuredImageCaption: json["featured_image_caption"],
        featuredImageSizes: FeaturedImageSizes.fromJson(json["featured_image_sizes"]),
        readTime: readTimeValues.map[json["read_time"]],
        featured: json["featured"],
        isPremium: json["is_premium"],
        postType: json["post_type"],
        isFavorited: json["is_favorited"],
        topicStyle: styleValues.map[json["topic_style"]],
        url: EaqueUrl.fromJson(json["url"]),
        publisher: Publisher.fromJson(json["publisher"]),
        topic: Topic.fromJson(json["topic"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        createdAt: edAtValues.map[json["created_at"]],
        updatedAt: edAtValues.map[json["updated_at"]],
        publishedAt: edAtValues.map[json["published_at"]],
        publishedDate: publishedDateValues.map[json["published_date"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "summary": summary,
        "body": body,
        "slug": slug,
        "featured_image": featuredImage,
        "featured_image_caption": featuredImageCaption,
        "featured_image_sizes": featuredImageSizes.toJson(),
        "read_time": readTimeValues.reverse[readTime],
        "featured": featured,
        "is_premium": isPremium,
        "post_type": postType,
        "is_favorited": isFavorited,
        "topic_style": styleValues.reverse[topicStyle],
        "url": url.toJson(),
        "publisher": publisher.toJson(),
        "topic": topic.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "created_at": edAtValues.reverse[createdAt],
        "updated_at": edAtValues.reverse[updatedAt],
        "published_at": edAtValues.reverse[publishedAt],
        "published_date": publishedDateValues.reverse[publishedDate],
    };
}

class EaqueUrl {
    EaqueUrl({
        this.name,
        this.params,
    });

    Name name;
    FluffyParams params;

    factory EaqueUrl.fromJson(Map<String, dynamic> json) => EaqueUrl(
        name: nameValues.map[json["name"]],
        params: FluffyParams.fromJson(json["params"]),
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "params": params.toJson(),
    };
}

class FluffyParams {
    FluffyParams({
        this.topic,
        this.slug,
    });

    String topic;
    String slug;

    factory FluffyParams.fromJson(Map<String, dynamic> json) => FluffyParams(
        topic: json["topic"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "topic": topic,
        "slug": slug,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
