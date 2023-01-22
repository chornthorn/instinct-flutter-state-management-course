class PostModel {
  PostModel();

  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
