// import 'package:brainteaser/Screen/questionscreen.dart';
// import 'package:flutter/material.dart';

// class QuizApp extends StatelessWidget {
//   const QuizApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.pink[300],
//         body: Stack(
//           children: [
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "let's play Quiz",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       'Enter your informations below',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.person),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 style: BorderStyle.solid,
//                               ),
//                               borderRadius: BorderRadius.circular(12)),
//                           hintText: "Full Name"),
//                     ),
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Progressbar()));
//                       },
//                       child: Container(
//                         height: 50,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             gradient: const LinearGradient(
//                                 colors: [Colors.green, Colors.lightBlue])),
//                         child: const Center(
//                             child: Text(
//                           "Let's Play Quiz",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         )),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
