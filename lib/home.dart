

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      crossAxisSpacing: 10),
      children: [
        Image.network('https://picsum.photos/250?image=1'),
        Image.network('https://picsum.photos/250?image=2'),
        Image.network('https://picsum.photos/250?image=3'),
        Image.network('https://picsum.photos/250?image=4'),
      ],
    );
  }
}
