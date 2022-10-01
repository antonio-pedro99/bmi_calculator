import 'package:bmi_calculator/controller/data_input_controller.dart';
import 'package:bmi_calculator/view/customs/custom_button.dart';
import 'package:bmi_calculator/view/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

int valueGap = 1;
int maxValue = 200;
double value = (maxValue - valueGap) / 2;

class _HeightPageState extends State<HeightPage> {
  late var heightController = PageController();

  double _offset = 0.0;

  int _currentPage = (maxValue ~/ valueGap / 2).floor();
  @override
  void initState() {
    super.initState();

    heightController =
        PageController(viewportFraction: .05, initialPage: _currentPage);

    heightController.addListener(() {
      setState(() {
        _offset = heightController.page!;
        value = _offset * valueGap;
        int position = heightController.page!.floor();

        if (position != _currentPage) {
          print("Position ${value * 3}");
          _currentPage = position;
        }
      });
    });
  }

  @override
  void dispose() {
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: LimitedBox(
                        maxHeight: size.height * .65,
                        child: Image.asset(
                          Provider.of<DataProvider>(context).isMaleSelected
                              ? "assets/man_standing.png"
                              : "assets/girl_standing.png",
                          height: value.toDouble() * 3,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: 100,
                        height: size.height * .65,
                        child: PageView.builder(
                            //physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            padEnds: false,
                            itemBuilder: (context, index) {
                              int current = index + 1;
                              bool selectedHeight = _currentPage == index;
                              print("${_currentPage + 6}");
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$current",
                                    style: TextStyle(
                                        color: selectedHeight
                                            ? Colors.yellow
                                            : current % 5 == 0
                                                ? Colors.white
                                                : Colors.white.withOpacity(.5),
                                        fontWeight: current % 5 == 0
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                  Container(
                                    color: current % 5 == 0
                                        ? Colors.white
                                        : Colors.white.withOpacity(.5),
                                    height: 2,
                                    width: current % 5 == 0 ? 15 : 10,
                                  )
                                ],
                              );
                            },
                            controller: heightController,
                            itemCount: maxValue ~/ valueGap))
                  ],
                ),
                CurvedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (context) {
                        return const ResultPage();
                      },
                    ), ((route) => false));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
