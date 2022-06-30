// import 'package:battery_saver_app/utils/constants.dart';
// import 'package:flutter/material.dart';

// class PopUp extends StatelessWidget {
//   const PopUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(),
//     );
//   }
// }


// Expanded(
//       child: GestureDetector(
//         onTap: Navigator.of(context).pop,
//         child: Container(
//           decoration: BoxDecoration(
//             // backgroundBlendMode: BlendMode.overlay,
//             color: indi300,
//           ),
//           child: Center(
//             child: Container(
//                 height: 170,
//                 width: 200,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0)),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.indigoAccent,
//                         spreadRadius: 10.0,
//                         blurRadius: 10.0,
//                       )
//                     ]),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 35,
//                       width: double.infinity,
//                       color: compliment1,
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Text(
//                           "Battery Health",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//           ),
//         ),
//       ),
//     );