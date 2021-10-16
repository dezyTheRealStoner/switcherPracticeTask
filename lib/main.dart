import 'package:flutter/material.dart';

void main() {
  runApp(const SwitcherApp());
}

class SwitcherApp extends StatelessWidget {
  const SwitcherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image switcher'.toUpperCase(),),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: Center(
            child: Switcher(),
          ),
        ),
      ),
    );
  }
}

class Switcher extends StatefulWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateSwitcher();
  }
}

class _StateSwitcher extends State<Switcher> {
  bool btn = true;
  Color? color;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = dataSwitcher()[0];
    final String text = dataSwitcher()[1];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Image(
            image: NetworkImage(imageUrl),
            height: 250,
          ),
        ),
        const SizedBox(height: 20,),
        Text(
          text.toUpperCase(),
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: color),
        ),
        const SizedBox(height: 20,),
        FloatingActionButton(
          onPressed: updateState,
          child: const Icon(Icons.swap_calls),
          backgroundColor: color,
          splashColor: Colors.deepPurple,
        ),
      ],
    );
  }

  void updateState() {
    setState(() {
      btn = !btn;
    });
  }

  List dataSwitcher() {
    List<String> cowData = [
      'https://images.freeimages.com/images/large-previews/d00/cow-1323686.jpg',
      'This is a cow'
    ];
    List<String> bullData = [
      'https://images.freeimages.com/images/large-previews/f01/longhorn-1-1382897.jpg',
      'This is a bull'
    ];

    if (btn == true) {
      color = Colors.blue;
      return cowData;
    } else {
      color = Colors.redAccent;
      return bullData;
    }
  }
}
