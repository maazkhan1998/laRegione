import '../../networking/api_base_helper.dart';
import '../models/authorFollowedPostModel.dart';
import '../models/favoritePostModel.dart';
import '../models/singlePostModel.dart';
import '../models/subscribedPost.dart';
import '../models/topicPostModel.dart';

import '../webServicesConstant.dart';
import '../models/homePostModel.dart';

class HomeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<HomePost> getAllHomePost() async {
    final response = await _helper.get('posts', initialHeader);
    return HomePost.fromJson(response);
  }

  Future<SinglePost> getSinglePost(String postID) async {
    final response = await _helper.get(singlePostURL(postID), initialHeader);
    return SinglePost.fromJson(response);
  }

  Future<TopicPost> getTopicPosts() async {
    final response = await _helper.get(topicPostURL, initialHeader);
    return TopicPost.fromJson(response);
  }

  Future<SubscribedPost> getSubscribedPosts() async {
    final header = initialHeader;
    header.addAll({'Authorization': 'Bearer $token'});
    final response = await _helper.get(subscribedPostURL, header);
    return SubscribedPost.fromJson(response);
  }

  Future<AuthorFollowedPost> getAuthorFollowedPosts() async {
    final header = initialHeader;
    header.addAll({'Authorization': 'Bearer $token'});
    final response = await _helper.get(followedPostURL, header);
    return AuthorFollowedPost.fromJson(response);
  }

  Future<FavoritesPost> getFavoritePosts() async {
    final response = await _helper.get(favoritePostURL, {});
    return FavoritesPost.fromJson(response);
  }
}
