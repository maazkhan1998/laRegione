String loginURL (String email,String password)=>'token?email=$email&password=$password&device_name=postman';

String singlePostURL(String postID)=>'posts/$postID';

const String topicPostURL='topics/alias/posts';

const String subscribedPostURL='me/subscribed';

const String followedPostURL='me/followed';

const String favoritePostURL='me/favorites';