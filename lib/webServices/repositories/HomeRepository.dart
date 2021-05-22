import 'package:laregione/networking/api_base_helper.dart';
import 'package:laregione/webServices/models/authorFollowedPostModel.dart';
import 'package:laregione/webServices/models/favoritePostModel.dart';
import 'package:laregione/webServices/models/homePostsModel.dart';
import 'package:laregione/webServices/models/singlePostModel.dart';
import 'package:laregione/webServices/models/subscribedPost.dart';
import 'package:laregione/webServices/models/topicPostModel.dart';

import '../webServicesConstant.dart';

class HomeRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<HomePost> getAllHomePost()async{
    final response=await _helper.get('posts');
    return HomePost.fromJson(response);
  }

  Future<SinglePost> getSinglePost(String postID)async{
    final response=await _helper.get(singlePostURL(postID));
    return SinglePost.fromJson(response);
  }

  Future<TopicPost> getTopicPosts()async{
    final response=await _helper.get(topicPostURL);
    return TopicPost.fromJson(response);
  }

  Future<SubscribedPost> getSubscribedPosts()async{
    final response=await _helper.get(subscribedPostURL);
    return SubscribedPost.fromJson(response);
  }

  Future<AuthorFollowedPost> getAuthorFollowedPosts()async{
    final response=await _helper.get(followedPostURL);
    return AuthorFollowedPost.fromJson(response);
  }

  Future<FavoritesPost> getFavoritePosts()async{
    final response=await _helper.get(favoritePostURL);
    return FavoritesPost.fromJson(response);
  }

}