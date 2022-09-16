
import 'dart:html';

class Data {
  String id;
  String word;
  String price;
  String imageURL;
  String description;
  Data({
    required this.id,
    required this.word,
    required this.price,
    required this.imageURL,
    required this.description,
  });
  //   factory Data.fromDocument(document doc) {
  //   return Data(
  //     id: doc[],
  //     word: doc['email'],
  //     price: doc['username'],
  //     imageURL: doc['photoUrl'],
  //     description: doc['displayName'],
  //   );
  // }

}
