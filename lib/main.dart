import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 9, 10, 35),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 36, 37, 67),
          title: Text(
            'Game',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 1;
  void changImage() {
    setState(() {
      leftImageNumber = Random().nextInt(8) + 1;
      rightImageNumber = Random().nextInt(8) + 1;
    });
  }

  @override
  void initState() {
    super.initState();
    changImage();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? 'لقد فزت' : 'حاول مرة اخرى',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changImage();
                  });
                },
                child: Image.asset('images/image-$leftImageNumber.png'),
              ),
            ),
            //   SizedBox(width: 40,),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changImage();
                  });
                },
                child: Image.asset('images/image-$rightImageNumber.png'),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
