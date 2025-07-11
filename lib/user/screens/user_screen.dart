// import 'package:flutter/material.dart';
// import 'package:learn_flutter/user/provider/user_provider.dart';
// import 'package:provider/provider.dart';

// class UserScreen extends StatelessWidget {
//   const UserScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = context.watch<UserProvider>();
//     return Scaffold(
//       appBar: AppBar(title: Text("User Information")),
//       body: ListView.builder(
//         itemCount: userProvider.userList.length,
//         itemBuilder: (context, index) {
//           final user = userProvider.userList[index];
//           return Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(user.id.toString()),
//                 Text(user.name ?? "N/A"),
//                 Text(user.username ?? "N/A"),
//                 Text(user.email ?? "N/A"),
//                 Text(user.phone ?? "N/A"),
//                 Text(user.address?.city ?? "N/A"),
//                 Text(user.address?.street ?? "N/A"),
//                 Text(user.address?.suite ?? "N/A"),
//                 Text(user.address?.zipcode ?? "N/A"),
//                 Text(user.address?.geo?.lat ?? "N/A"),
//                 Text(user.address?.geo?.lng ?? "N/A"),
//                 Text(user.company?.name ?? "N/A"),
//                 Text(user.company?.bs ?? "N/A"),
//                 Text(user.company?.catchPhrase ?? "N/A"),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
