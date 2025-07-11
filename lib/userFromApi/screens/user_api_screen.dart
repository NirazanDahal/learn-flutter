import 'package:flutter/material.dart';
import 'package:learn_flutter/userFromApi/providers/user_API_provider.dart';
import 'package:provider/provider.dart';

class UserAPIScreen extends StatelessWidget {
  const UserAPIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userAPIProvider = context.watch<UserAPIProvider>();
    final cvList = userAPIProvider.cvList.cv ?? [];

    return Scaffold(
      appBar: AppBar(title: Text("User Information")),
      body: ListView.builder(
        itemCount: cvList.length,
        itemBuilder: (context, index) {
          final cv = cvList[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("Name: ${cv.personalInfo?.name ?? "N/A"}"),
                  Text("Email: ${cv.personalInfo?.email ?? "N/A"}"),
                  Text("Phone: ${cv.personalInfo?.phone ?? "N/A"}"),
                  Text("Summary: ${cv.personalInfo?.summary ?? "N/A"}"),
                  SizedBox(height: 10),

                  Text(
                    "Education",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    itemCount: cv.education?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      final edu = cv.education![i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Degree: ${edu.degree ?? "N/A"}"),
                          Text("Institution: ${edu.institution ?? "N/A"}"),
                          Text("From: ${edu.startDate ?? "N/A"}"),
                          Text("To: ${edu.endDate ?? "N/A"}"),
                          Text("Description: ${edu.description ?? "N/A"}"),
                          SizedBox(height: 5),
                        ],
                      );
                    },
                  ),

                  Text(
                    "Experience",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    itemCount: cv.experience?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      final exp = cv.experience![i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title: ${exp.title ?? "N/A"}"),
                          Text("Company: ${exp.company ?? "N/A"}"),
                          Text("From: ${exp.startDate ?? "N/A"}"),
                          Text("To: ${exp.endDate ?? "N/A"}"),
                          Text("Description: ${exp.description ?? "N/A"}"),
                          SizedBox(height: 5),
                        ],
                      );
                    },
                  ),

                  Text(
                    "Projects",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    itemCount: cv.projects?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      final project = cv.projects![i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name: ${project.name ?? "N/A"}"),
                          Text("Description: ${project.description ?? "N/A"}"),
                          Text(
                            "Technologies:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ...?project.technologies?.map(
                            (tech) => Text("- $tech"),
                          ),
                          SizedBox(height: 5),
                        ],
                      );
                    },
                  ),

                  Text(
                    "Skills",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...?cv.skills?.map((skill) => Text("- $skill")),

                  SizedBox(height: 10),
                  Text(
                    "User Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("User ID: ${cv.userId?.sId ?? "N/A"}"),
                  Text("User Name: ${cv.userId?.name ?? "N/A"}"),
                  Text("User Email: ${cv.userId?.email ?? "N/A"}"),

                  SizedBox(height: 10),
                  Text(
                    "Meta",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("CV ID: ${cv.sId ?? "N/A"}"),
                  Text("Created At: ${cv.createdAt ?? "N/A"}"),
                  Text("Updated At: ${cv.updatedAt ?? "N/A"}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
