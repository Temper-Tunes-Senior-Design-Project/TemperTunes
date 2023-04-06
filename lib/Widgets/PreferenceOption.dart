import 'package:easy_stepper/easy_stepper.dart';

import 'MyPalette.dart';

class PreferenceOption extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final Icon icon;
  final void Function() onPressed;

  PreferenceOption(this.text, this.height, this.width, this.icon,
      this.onPressed, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.03 * height),
      alignment: Alignment.topCenter,
      child: Flexible(
        flex: 1,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.pinkAccent,
          ),
          icon: icon,
          label: FittedBox(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Maven Pro',
                color: Colors.white,
                fontSize: fontSize,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),

      // TextButton(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         //  alignment: Alignment.center,
      //         alignment: Alignment.centerRight,
      //         child: icon,
      //       ),
      //
      //       ///Name
      //       Flexible(
      //         flex: 2,
      //         fit: FlexFit.tight,
      //         child: Container(
      //           //  padding: EdgeInsets.only(right: 0.025 * width),
      //           alignment: Alignment.center,
      //           // alignment: Alignment.topLeft,
      //           child: FittedBox(
      //             child: Text(
      //               text,
      //               style: TextStyle(
      //                 fontFamily: 'Maven Pro',
      //                 color: Colors.white,
      //                 fontSize: fontSize,
      //               ),
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      //   onPressed: onPressed,
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: Colors.transparent,
      //     foregroundColor: Colors.pinkAccent,
      //   ),
      // ),
    );
  }
}

// import 'package:easy_stepper/easy_stepper.dart';
//
// import 'MyPalette.dart';
//
// class PreferenceOption extends StatelessWidget {
//   final String text;
//   final double height;
//   final double width;
//   final double fontSize;
//   final Icon icon;
//   final void Function() onPressed;
//
//   PreferenceOption(this.text, this.height, this.width, this.icon,
//       this.onPressed, this.fontSize);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 0.035 * height),
//       child: TextButton(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               alignment: Alignment.topLeft,
//               child: icon,
//             ),
//
//             ///Name
//             Container(
//               padding: EdgeInsets.only(left: 0.01 * width),
//               alignment: Alignment.topLeft,
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   fontFamily: 'Maven Pro',
//                   color: Colors.white,
//                   fontSize: fontSize,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.pinkAccent,
//         ),
//       ),
//     );
//   }
// }
