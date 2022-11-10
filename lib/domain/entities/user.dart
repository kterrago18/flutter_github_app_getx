class User {
  final String login;
  final String avatarUrl;
  final String name;
  final int publicRepos;
  final int followers;
  final int following;
  final String htmlUrl;
  User({
    this.login = '',
    this.avatarUrl = '',
    this.name = '',
    this.publicRepos = 0,
    this.followers = 0,
    this.following = 0,
    this.htmlUrl = ''
  });
}
