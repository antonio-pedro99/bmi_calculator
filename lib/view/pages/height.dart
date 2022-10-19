import 'package:bmi_calculator/providers/person.dart';
import 'package:bmi_calculator/view/customs/custom_button.dart';
import 'package:bmi_calculator/view/customs/ruler_indicator.dart';
import 'package:bmi_calculator/view/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

int maxValue = 200;

class _HeightPageState extends State<HeightPage> {
  late var heightController = PageController();

  int _currentCentimeter = 144;
  late double _selectedHeight = 160;

  @override
  void initState() {
    super.initState();

    //getAverageHeightByGender(context);
    heightController =
        PageController(viewportFraction: .05, initialPage: _currentCentimeter);

    heightController.addListener(() {
      setState(() {
        int position = heightController.page!.floor();

        if (position != _currentCentimeter) {
          _currentCentimeter = position;
          _selectedHeight =
              ((_currentCentimeter.toInt() * 2.935) * maxValue) / 529.2;

          //set height

          trackAndSetHeight(context);
        }
      });
    });
  }

  void trackAndSetHeight(BuildContext context) {
    Provider.of<PersonProvider>(context, listen: false)
        .setPersonHeight(_selectedHeight.round());
  }

/*   void getAverageHeightByGender(BuildContext context) {
    bool isMale =
        Provider.of<PersonProvider>(context, listen: false).isMaleSelected;

    if (isMale) {
      _selectedHeight = 176;
      _currentCentimeter = (((_selectedHeight * 529.2) / 200) / 2.925).round();
      print("$_currentCentimeter");
    }
  } */

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
          /*   actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help),
              tooltip: "Get Help",
            )
          ], */
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const RulerIndicator(),
                          LimitedBox(
                            maxHeight: size.height * .65,
                            child: Image.asset(
                              Provider.of<PersonProvider>(context)
                                      .isMaleSelected
                                  ? "assets/man_standing.png"
                                  : "assets/girl_standing.png",
                              height: _currentCentimeter * 2.94,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: 80,
                        height: size.height * .65,
                        child: PageView.builder(
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            padEnds: false,
                            itemBuilder: (context, index) {
                              int current = index + 1;
                              bool selectedCentimeter =
                                  _selectedHeight.round() == current;

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "$current",
                                    style: TextStyle(
                                        color: selectedCentimeter
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
                            itemCount: maxValue))
                  ],
                ),
                CurvedButton(
                  onPressed: () {
                    Provider.of<PersonProvider>(context, listen: false)
                        .getPersonBodyMassIndex();
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
