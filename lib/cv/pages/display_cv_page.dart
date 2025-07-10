import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learn_flutter/cv/providers/cv_provider.dart';
import 'package:provider/provider.dart';

class DisplayCVPage extends StatelessWidget {
  const DisplayCVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cvProvider = context.watch<CvProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Your recent CV's")),
      body: ListView.builder(
        itemCount: cvProvider.cvList.length,
        itemBuilder: (context, index) {
          return cvProvider.cvList.isEmpty
              ? Text("No CV's yet")
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cvProvider.cvList[index].firstName,
                                style: TextStyle(
                                  letterSpacing: 8,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                cvProvider.cvList[index].middleName,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 4,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(cvProvider.cvList[index].lastName),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          child: Row(children: [Divider(thickness: 50)]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.memory(
                            height: 100,
                            base64Decode(cvProvider.cvList[index].imageString),
                          ),
                        ),
                      ],
                    ),

                    Text(cvProvider.cvList[index].address),
                    Text(cvProvider.cvList[index].age),
                  ],
                );
        },
      ),
    );
  }
}
