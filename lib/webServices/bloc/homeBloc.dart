import 'dart:async';

import 'package:laregione/networking/api_response.dart';
import 'package:laregione/webServices/models/authorFollowedPostModel.dart';
import 'package:laregione/webServices/models/favoritePostModel.dart';
import 'package:laregione/webServices/models/singlePostModel.dart';
import 'package:laregione/webServices/models/subscribedPost.dart';
import 'package:laregione/webServices/models/topicPostModel.dart';
import 'package:laregione/webServices/repositories/HomeRepository.dart';
import '../models/homePostModel.dart';

class HomeBloc {
  HomeRepository _homeRepository;

  StreamController _homePostController;
  StreamSink<ApiResponse<HomePost>> get homePostSink =>
      _homePostController.sink;
  Stream<ApiResponse<HomePost>> get homePostStream =>
      _homePostController.stream;

  StreamController _singlePostController;
  StreamSink<ApiResponse<SinglePost>> get singlePostSink =>
      _singlePostController.sink;
  Stream<ApiResponse<SinglePost>> get singlePostStream =>
      _singlePostController.stream;

  StreamController _topicPostController;
  StreamSink<ApiResponse<TopicPost>> get topicPostSink =>
      _topicPostController.sink;
  Stream<ApiResponse<TopicPost>> get topicPostStream =>
      _topicPostController.stream;

  StreamController _subscribedPostController;
  StreamSink<ApiResponse<SubscribedPost>> get subscibedPostSink =>
      _subscribedPostController.sink;
  Stream<ApiResponse<SubscribedPost>> get subscribedPostStream =>
      _subscribedPostController.stream;

  StreamController _followedPostController;
  StreamSink<ApiResponse<AuthorFollowedPost>> get followedPostSink =>
      _followedPostController.sink;
  Stream<ApiResponse<AuthorFollowedPost>> get followedPostStream =>
      _followedPostController.stream;

  StreamController _favoritePostController;
  StreamSink<ApiResponse<FavoritesPost>> get favoritePostSink =>
      _favoritePostController.sink;
  Stream<ApiResponse<FavoritesPost>> get favoritePostStream =>
      _favoritePostController.stream;

  HomeBloc() {
    _homeRepository = HomeRepository();
    _homePostController = StreamController<ApiResponse<HomePost>>();
    _singlePostController =
        StreamController<ApiResponse<SinglePost>>.broadcast();
    _topicPostController = StreamController<ApiResponse<TopicPost>>();
    _subscribedPostController = StreamController<ApiResponse<SubscribedPost>>();
    _followedPostController =
        StreamController<ApiResponse<AuthorFollowedPost>>();
    _favoritePostController = StreamController<ApiResponse<FavoritesPost>>();
  }

  fetchHomePost() async {
    homePostSink.add(ApiResponse.loading('home loading'));
    try {
      HomePost posts = await _homeRepository.getAllHomePost();
      homePostSink.add(ApiResponse.completed(posts));
    } catch (e) {
      homePostSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchSinglePost(String postID) async {
    singlePostSink.add(ApiResponse.loading('fetching'));
    try {
      SinglePost post = await _homeRepository.getSinglePost(postID);
      singlePostSink.add(ApiResponse.completed(post));
    } catch (e) {
      singlePostSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchTopicPosts() async {
    topicPostSink.add(ApiResponse.loading('fetching'));
    try {
      TopicPost posts = await _homeRepository.getTopicPosts();
      topicPostSink.add(ApiResponse.completed(posts));
    } catch (e) {
      topicPostSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchSubscribedPosts() async {
    subscibedPostSink.add(ApiResponse.loading('fetching'));
    try {
      SubscribedPost posts = await _homeRepository.getSubscribedPosts();
      subscibedPostSink.add(ApiResponse.completed(posts));
    } catch (e) {
      subscibedPostSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchAuthorFollowedPosts() async {
    followedPostSink.add(ApiResponse.loading('fetching'));
    try {
      AuthorFollowedPost posts = await _homeRepository.getAuthorFollowedPosts();
      followedPostSink.add(ApiResponse.completed(posts));
    } catch (e) {
      followedPostSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  fetchFavoritePosts() async {
    favoritePostSink.add(ApiResponse.loading('fetching'));
    try {
      FavoritesPost posts = await _homeRepository.getFavoritePosts();
      favoritePostSink.add(ApiResponse.completed(posts));
    } catch (e) {
      favoritePostSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _homePostController?.close();
    _singlePostController?.close();
    _topicPostController?.close();
    _subscribedPostController?.close();
    _followedPostController?.close();
    _favoritePostController?.close();
  }
}
