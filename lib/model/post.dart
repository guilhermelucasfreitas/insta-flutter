import 'package:insta/model/comments.dart';
import 'package:insta/model/person.dart';

class Post {
  int postId;
  int personId;
  String created;
  String photoUri;
  int likes;
  Person person;
  List<Comments> comments;

  Post(
      {this.postId,
        this.personId,
        this.created,
        this.photoUri,
        this.likes,
        this.person,
        this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    personId = json['personId'];
    created = json['created'];
    photoUri = json['photoUri'];
    likes = json['likes'];
    person =
    json['person'] != null ? new Person.fromJson(json['person']) : null;
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['personId'] = this.personId;
    data['created'] = this.created;
    data['photoUri'] = this.photoUri;
    data['likes'] = this.likes;
    if (this.person != null) {
      data['person'] = this.person.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

