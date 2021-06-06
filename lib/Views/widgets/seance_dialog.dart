// *! NOT RUNNING, BUT WORKS CONTINUE

// import 'package:fit_diyet/model/seance_model.dart';
// import 'package:fit_diyet/views/doctor/doctor_detail.dart';
// import 'package:fit_diyet/widgets/seance_list.dart';

// import 'package:flutter/material.dart';

//  Widget showSeancelDialog(BuildContext context) {
//   return AlertDialog(
//     title: Text("Seanslar"),
//     content: Expanded(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         itemCount: seanceList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => DiyetisyenListViewDetail(
//                     seanceModel: seanceList[index],
//                   ),
//                 ),
//               );
//             },
//             child: buildSeancesList(
//               seanceList[index],
//             ),
//           );
//         },
//       ),
//     ),
//     actions: <Widget>[
//       ElevatedButton(
//         child: Text('Close me!'),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       )
//     ],
//   );
// }
