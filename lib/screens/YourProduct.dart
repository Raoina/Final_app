import 'package:flutter/material.dart';
import 'package:wordapp/screens/Edit.dart';
import 'package:wordapp/screens/Home.dart';

class Pro extends StatefulWidget {
  Pro({
    Key? key,
    required this.img,
    required this.word,
    required this.list,
  }) : super(key: key);
  String img;
  String word;
  List list = [];

  @override
  State<Pro> createState() => YourProduct(list: list);
}

class YourProduct extends State<Pro> {
  YourProduct({
    Key? key,
    // required this.img,
    // required this.word,
    required this.list,
    //required this.delete
  }) : super();
  deleteWord(String id) {
    setState(() {
      list.removeWhere((element) => element.id == id);
    });
  }

  // String img;
  // String word;
  //Function delete;
  List list = [];
  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Products",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(25533, 219, 78, 2),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: ((context, index) => WordCard(
                img: list[index].imageURL,
                word: list[index].word,
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProEdit(
                                    id: list[index].id,
                                    description: list[index].description,
                                    imageURL: list[index].imageURL,
                                    price: list[index].price,
                                    word: list[index].word,
                                    list: list,
                                    index: index,
                                  )),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      color: const Color.fromARGB(255, 219, 78, 2),
                    ),
                    IconButton(
                        onPressed: () {
                          deleteWord(list[index].id);
                          WordScreen().deleteWordHome(list[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 255, 0, 0),
                        )),
                  ],
                ))),
            itemCount: list.length,
          )),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class WordCard extends StatelessWidget {
  final Widget trailing;
  final String img;
  final String word;
  const WordCard({
    required this.trailing,
    required this.img,
    required this.word,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(img),
            radius: 20,
          ),
          title: Text(word),
          trailing: trailing,
        ),
      ),
    );
  }
}
// //////////////////////////////////////////////////////////////////////////////

class NoProduct extends StatelessWidget {
  const NoProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Products",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(25533, 219, 78, 2),
      ),
      body: const Center(
        child: Text(
          "Sorry No product to Display now.\nPlease add new one in the home page",
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(25533, 219, 78, 2),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
