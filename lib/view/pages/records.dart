import 'package:bmi_calculator/data/models/person.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/view/theme/colors.dart';
import 'package:bmi_calculator/view/theme/typography.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  showRecordDetails(Person record) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "Your Result",
              ),
            ),
            backgroundColor: primary,
            content: SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Your BMI",
                            style: CustomTypography.labelNormal,
                          ),
                          Text(
                            record.bodyMassIndex!.toStringAsFixed(2),
                            style: CustomTypography.bodyLarge,
                          ),
                          Text("${record.height} cm",
                              style: CustomTypography.bodyMedium),
                          Text("${record.weight} kg",
                              style: CustomTypography.bodyMedium)
                        ]),
                  ],
                )),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    var streamPerson = localStorage.getRecords();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your ",
                style: TextStyle(color: Colors.white.withOpacity(.5)),
              ),
              const Text("Records",
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
              child: StreamBuilder(
                stream: streamPerson,
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Something wrong"));
                  }

                  List<Person> records = snapshot.data as List<Person>;
                  return ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: primary,
                            radius: 45,
                            child: Icon(
                              records[index].gender == "Male"
                                  ? Icons.boy
                                  : Icons.girl,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "${records[index].name}",
                            style: CustomTypography.bodyMedium,
                          ),
                          subtitle: Text(
                            "${records[index].age} year-old",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontSize: 16),
                          ),
                          onTap: () => showRecordDetails(records[index]),
                        );
                      });
                }),
              )),
        ));
  }
}
