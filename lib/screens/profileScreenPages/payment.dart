// import 'package:flutter/material.dart';
// import '../../utils/constants.dart';
// import '../../widgets/creditcard.dart';

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   @override
//   Widget build(BuildContext context) {
//     var height = SizeConfig.getHeight(context);
//     var width = SizeConfig.getWidth(context);
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 235, 236, 242),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 235, 236, 242),
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black87),
//         title: const Text(
//           'Payment Options',
//           style: TextStyle(
//               color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * 0.78,
//                 child: Column(
//                   children: [
//                     CreditCard(
//                       gradient: gradients[1],
//                       expDate: '10/24',
//                       cardNo: '1234567890123',
//                       isVisibile: true,
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: <Color>[
//                         Color.fromARGB(255, 55, 70, 253),
//                         Color.fromARGB(255, 122, 35, 160),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(15),
//                     ),
//                   ),
//                   height: height * 0.05,
//                   width: width * 0.9,
//                   child: const Center(
//                     child: Text(
//                       "Add new card",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
