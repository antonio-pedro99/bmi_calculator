import 'package:bmi_calculator/functions.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/providers/person.dart';
import 'package:bmi_calculator/view/customs/composition_tile.dart';
import 'package:bmi_calculator/view/customs/custom_button.dart';
import 'package:bmi_calculator/view/pages/home.dart';
import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:bmi_calculator/view/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<PersonProvider>(context, listen: true);
    var person = provider.getPerson;
    TextEditingController nameController = TextEditingController();
    var key = GlobalKey<FormState>();

    showSaveDialog() {
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Center(
                child: Text("Save"),
              ),
              content: SizedBox(
                  child: Form(
                key: key,
                child: TextFormField(
                  validator: (str) {
                    return str!.isEmpty ? "Name is Missing" : null;
                  },
                  controller: nameController,
                  cursorColor: primary,
                  decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                      filled: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: primary))),
                ),
              )),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        provider.setPersonName(nameController.text);
                        localStorage.saveRecord(person);
                        provider.resetValues();

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const MyHomePage();
                        }), (r) => false);
                      }
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: primary),
                    ))
              ],
            );
          }));
    }

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
                    "Your ",
                    style: TextStyle(color: Colors.white.withOpacity(.5)),
                  ),
                  const Text("Results",
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
            )
          ];
        },
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 240,
                width: 240,
                decoration: decoratedBoxGradient,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style: CustomTypography.titleMedium,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      person.bodyMassIndex!.toStringAsFixed(2),
                      style: CustomTypography.bodyLarge,
                    ),
                    Text(
                      getStatus(person.bodyMassIndex!),
                      style: CustomTypography.bodyMedium,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Text(
                "Body Composition ",
                style: TextStyle(color: Colors.white.withOpacity(.5)),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 120,
                    color: darkBlue,
                    child: Image.asset(person.gender == "Male"
                        ? "assets/b_normal.png"
                        : "assets/b_normal_girl.png"),
                  ),
                  CompositionTile(
                    value: "${person.age}",
                    title: "Age",
                  )
                ],
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CompositionTile(
                    value: "${person.height}",
                    title: "Centimeter",
                  ),
                  CompositionTile(
                    value: "${person.weight}",
                    title: "Kg",
                  )
                ],
              ),
              SizedBox(
                height: size.height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CurvedButton(
                    text: "Retry",
                    icon: Icons.restore,
                    onPressed: () {
                      Provider.of<PersonProvider>(context, listen: false)
                          .resetValues();

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return const MyHomePage();
                        },
                      ), ((route) => false));
                    },
                  ),
                  SizedBox(
                    width: size.width * .05,
                  ),
                  CurvedButton(
                      text: "Save",
                      icon: Icons.save,
                      color: Colors.green,
                      onPressed: showSaveDialog)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
