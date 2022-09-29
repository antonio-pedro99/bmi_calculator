import 'package:flutter/material.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Your ",
              style: TextStyle(color: Colors.white.withOpacity(.5)),
            ),
            const Text("Height",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
            tooltip: "Get Help",
          )
        ],
      ),
    );
  }
}
