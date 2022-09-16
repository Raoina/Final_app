import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  Info({
    Key? key,
    required this.img,
    required this.desc,
    required this.price,
    required this.title,
  }) : super(key: key);
  String img;
  String price;
  String title;
  String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 219, 78, 2),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: 150,
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    img,
                  ),
                ),
              ),
              Card(
                color: const Color.fromARGB(255, 227, 227, 227),
                elevation: 7,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            " \$    $price",
                            style:const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: const Color.fromARGB(255, 227, 227, 227),
                elevation: 7,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                             const Icon(Icons.description),
                             const SizedBox(
                                width: 5,
                              ),
                              Text(
                                desc,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
//https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXJ-AqfmnQRGP4wdNa9dSS1A4pONAwzz_Kug&usqp=CAU
