String loginURL (String email,String password)=>'login?email=$email&password=$password';

String singlePostURL(String postID)=>'posts/$postID';

const String topicPostURL='topics/alias/posts';

const String subscribedPostURL='me/subscribed';

const String followedPostURL='me/followed';

const String favoritePostURL='me/favorites';