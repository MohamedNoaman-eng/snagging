// import 'package:flutter/material.dart';
//
// class buildRefresh extends StatelessWidget {
//   buildRefresh({Key? key, required this.widget, this.onRefresh}) : super(key: key);
//   Future<void> onRefresh;
//   Widget widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       edgeOffset: 20,
//       displacement: 20,
//       strokeWidth: 3,
//       triggerMode: RefreshIndicatorTriggerMode.onEdge,
//       color: Colors.red,
//       onRefresh: onr,
//       child: Stack(children: [
//         widget,
//         ListView(),
//       ]),
//     );
//   }
// }
