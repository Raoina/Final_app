import 'package:flutter/material.dart';
import 'package:wordapp/screens/Data.dart';

class BoxText extends StatelessWidget {
  BoxText({
    Key? key,
    required this.addWord,
  }) : super(key: key);
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imagController = TextEditingController();

  final Function addWord;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //      child: ClipRRect( borderRadius: BorderRadius.circular(10),),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Card(
            color: const Color.fromARGB(255, 231, 229, 229),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _wordController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 219, 78, 2),
                      ),
                      hintText: 'Enter the new title',
                    ),
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 219, 78, 2),
                      ),
                      hintText: 'Enter the new price',
                    ),
                  ),
                  TextFormField(
                    controller: _descController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 219, 78, 2),
                      ),
                      hintText: 'Enter the word description',
                    ),
                    maxLines: 3,
                  ),
                  TextFormField(
                    controller: _imagController,
                    decoration: const InputDecoration(
                      labelText: 'Image URL',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 219, 78, 2),
                      ),
                      hintText: 'Enter the new imageURL',
                    ),
                    maxLines: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_wordController.text.isEmpty ||
                            _descController.text.isEmpty)
                          return;
                        else {
                          return addWord(Data(
                            id: DateTime.now().toString(),
                            word: _wordController.text.trim(),
                            price: _priceController.text.trim(),
                            description: _descController.text.trim(),
                            imageURL: _imagController.text.trim(),
                          ));
                        }
                      },
                      child: const Text(
                        "add",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: const Color.fromARGB(255, 219, 78, 2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
