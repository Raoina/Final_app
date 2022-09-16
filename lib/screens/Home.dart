import 'package:flutter/material.dart';
import 'package:wordapp/screens/Data.dart';
import 'package:flutter/gestures.dart';
import 'package:wordapp/screens/BoxText.dart';
import 'package:wordapp/screens/Info.dart';
import '../screens/YourProduct.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => WordScreen();
}

class WordScreen extends State<Home> {
  final List<Data> words = [];
  addimg() {
    for (int index = 0; index < words.length; index++) {
      return words[index].imageURL;
    }
  }

  addword() {
    for (int index = 0; index < words.length; index++) {
      return words[index].word;
    }
  }

  addid() {
    for (int index = 0; index < words.length; index++) {
      return words[index].id;
    }
  }

  bool isDeleted = false;
  deleteWordHome(String id) {
    setState(() {
      words.removeWhere((element) => element.id == id);
    });
  }

  void addWord(Data word) {
    setState(() {
      words.add(word);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => BoxText(addWord: addWord),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Shope",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(25533, 219, 78, 2),
        actions: [
          IconButton(
            onPressed: () {
              if (words.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pro(
                      img: addimg(),
                      word: addword(),
                      list: words,
                      // delete: addid(),
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoProduct(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.card_giftcard),
          ),
          const SizedBox(
            width: kDoubleTapSlop / 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => WordTile(
                desc: words[index].description,
                price: words[index].price,
                img: words[index].imageURL,
                title: words[index].word,
                tal: widget,
              )),
          itemCount: words.length,
        ),
      ),
      floatingActionButton: SizedBox(
        height: 100,
        child: Center(
          child: FloatingActionButton(
            onPressed: showBottomSheet,
            child: const Center(
                child: Text(
              "Add",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            backgroundColor: const Color.fromARGB(255, 219, 78, 2),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
class WordTile extends StatelessWidget {
  final String title;
  final String img;
  final Widget tal;
  final String desc;
  final String price;
  const WordTile({
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
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 200.0,
                width: 170.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Info(
                          img: img,
                          price: price,
                          desc: desc,
                          title: title,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: const Color.fromARGB(119, 0, 0, 0),
                    height: 40,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
