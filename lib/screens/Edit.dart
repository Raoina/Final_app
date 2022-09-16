import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:wordapp/screens/Home.dart';

class ProEdit extends StatefulWidget {
  ProEdit({
    Key? key,
    required this.id,
    required this.word,
    required this.price,
    required this.imageURL,
    required this.description,
    required this.list,
    required this.index,
  }) : super(key: key);
  String id;
  String word;
  String price;
  String imageURL;
  String description;
  List list = [];
  int index;

  @override
  State<ProEdit> createState() => Edit(list: list, index: index);
}

class Edit extends State<ProEdit> {
  Edit({
    Key? key,
    required this.list,
    required this.index,
  }) : super();
  bool ditTite = true;
  List list = [];
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Product",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 219, 78, 2),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
          const SizedBox(
            width: kDoubleTapSlop / 10,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WordEdit(
            desc: list[index].description,
            price: list[index].price,
            img: list[index].imageURL,
            title: list[index].word,
            tal: widget,
          )),
    );
  }
}
/////////////////////////////////////////////////////////

class WordEdit extends StatelessWidget {
  final String title;
  final String img;
  final Widget tal;
  final String desc;
  final String price;
  const WordEdit({
    required this.title,
    required this.img,
    required this.tal,
    required this.desc,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
              title: const Text(
                "Title",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              subtitle: TextFormField(
                  decoration: InputDecoration(
                hintText: title,
                hintStyle: const TextStyle(fontSize: 15.0, color: Colors.black),
              ))),
          ListTile(
              title: const Text(
                "Price",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              subtitle: TextFormField(
                  decoration: InputDecoration(
                hintText: price,
                hintStyle: const TextStyle(fontSize: 15.0, color: Colors.black),
              ))),
          ListTile(
              title: const Text(
                "Description",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              subtitle: TextFormField(
                decoration: InputDecoration(
                  hintText: desc,
                  hintStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                maxLines: 4,
              )),
          ListTile(
              title: const Text(
                "Image URL",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              subtitle: TextFormField(
                decoration: InputDecoration(
                  hintText: img,
                  hintStyle:
                      const TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                maxLines: 5,
              )),
        ],
      ),
    );
  }
}
