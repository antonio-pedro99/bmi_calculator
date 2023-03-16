import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              forceElevated: innerBoxIsScrolled,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI ",
                    style: TextStyle(color: Colors.white.withOpacity(.5)),
                  ),
                  const Text("ChatAI",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                ],
              ),
            )
          ];
        },
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
