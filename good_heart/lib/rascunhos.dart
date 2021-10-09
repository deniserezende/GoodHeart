// Padding(
//     padding: EdgeInsets.only(
//       top: screenSize.height *
//           default_padding, // AQUI arrumar com top: 0
//     ),
//     child: Container(
//         width: screenSize.width,
//         height: screenSize.height * default_container,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//             bottomLeft: Radius.circular(30),
//             bottomRight: Radius.circular(30),
//           ),
//           color: MyColors.red,
//         ),
//
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: screenSize.width * 0.1,
//           bottom: screenSize.height * 0.01,
//         ),
//           child: Row(
//             children: <Widget>[
//               // Folder icon button
//               Padding(
//                   padding: EdgeInsets.only(
//                     left: defaultButtom,
//                     bottom: screenSize.height * 0.01,
//                   ),
//                 child: InkWell(
//                   splashColor: Colors.green,
//                   highlightColor: Colors.blue,
//                   child: ImageIcon(
//                     AssetImage("/Users/Denise/Dropbox/GoodHeartDenise/good_heart/assets/images/Icons/folder-check.png"),
//                     color: Colors.black,
//                     size: 50,
//                   ),
//                   //Icon(Icons.folder, size: 50), // AQUI ORIGINAL
//                   onTap: () {
//                     print("clicou");
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: defaultButtom * 1.8,
//                   bottom: screenSize.height * 0.01,
//                 ),
//                 child: InkWell(
//                   splashColor: Colors.green,
//                   highlightColor: Colors.blue,
//                   child: ImageIcon(
//                     AssetImage("/Users/Denise/Dropbox/GoodHeartDenise/good_heart/assets/images/Icons/wifi-line.png"),
//                     color: Colors.black,
//                     size: 50,
//                   ),
//                   //Icon(Icons.folder, size: 50), // AQUI ORIGINAL
//                   onTap: () {
//                     print("click");
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: defaultButtom * 1.8,
//                   bottom: screenSize.height * 0.01,
//                 ),
//                 child: InkWell(
//                   splashColor: Colors.green,
//                   highlightColor: Colors.blue,
//                   child: ImageIcon(
//                     AssetImage("/Users/Denise/Dropbox/GoodHeartDenise/good_heart/assets/images/Icons/gears.png"),
//                     color: Colors.black,
//                     size: 50,
//                   ),
//                   //Icon(Icons.folder, size: 50), // AQUI ORIGINAL
//                   onTap: () {
//                     print("CLICK");
//                   },
//                 ),
//               ),
//
//         ],
//
//         ),
//       ),
//     ),
// ),






// import 'package:flutter/material.dart';
//
// class ConnectionPage extends StatelessWidget {
//
//   const ConnectionPage({ Key? key }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wifi connection'),
//       ),
//       body: SafeArea(
//         child: Stack(children: <Widget>[
//           Align(
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: (){
//                 // AQUI
//                 Navigator.of(context).pop();
//                 //Navigator.pushNamed(context, '/');
//               },
//               child: Icon(Icons.wifi),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Image.asset(
//               "assets/images/Gifs/ecg.gif",
//               height: 380.0,
//               width: 380.0,
//             ),
//           ),
//         ]
//         ),
//
//       ),
//
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'colors.dart';


//
// class DefaultHomePage extends StatefulWidget {
//   @override
//   _DefaultHomePage createState() => _DefaultHomePage();
// }
//
// class _DefaultHomePage extends State<DefaultHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // Figma Flutter Generator Iphone11promax1Widget - FRAME
//
//     const double default_padding = 0.88;
//     const double default_container = 1 - default_padding;
//
//     var screenSize = MediaQuery.of(context).size;
//
//     double defaultButtom = screenSize.width * 0.08;
//
//     int _selectedIndex = 0;
//     void _onItemTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//
//     return Scaffold(
//       // UPPER NAVIGATION BAR
//         body: Container(
//             width: screenSize.width,
//             height: screenSize.height,
//             child: Stack(children: <Widget>[
//
//               Padding(
//                   padding: EdgeInsets.only(
//                     top: 0,
//                   ),
//                   child: Container(
//                       width: screenSize.width,
//                       height: screenSize.height * 0.15, // AQUI
//                       decoration: BoxDecoration(
//                         color: MyColors.green,
//                       ),
//                       child: Padding(
//                           padding: EdgeInsets.only(
//                             left: screenSize.width * 0.05,
//                             top: screenSize.height * 0.05,
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               Container(
//                                 width: screenSize.width * 0.2,
//                                 height: screenSize.height * 0.2, // AQUI
//                                 decoration: BoxDecoration(
//                                     image: const DecorationImage(
//                                       // AQUI pesquisar como fazer com path relativo
//                                       image: AssetImage(
//                                           "/Users/Denise/Dropbox/GoodHeartDenise/good_heart/assets/images/AppIcon/GreenIconGoodHeartNoBackground.png"),
//                                     )),
//                               ),
//                               Container(
//                                   padding: EdgeInsets.only(
//                                     left: 5,
//                                   ),
//                                   child: Center(
//                                       child: Text(
//                                         'Good Heart',
//                                         style: TextStyle(
//                                           //fontFamily: 'ComicSans', //AQUI ver como trocar fonte
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18),
//                                       )))
//                             ],
//                           )))),
//
//
//             ]
//             )
//         ),
//         // BOTTOM NAVIGATION BAR
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.folder),
//               label: 'Consults',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.wifi),
//               label: 'Wifi',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings),
//               label: 'Settings',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: MyColors.green,
//           onTap: _onItemTapped,
//         )
//     );
//   }
// }
//
// /// Flutter code sample for AppBar
//
// // This sample shows an [AppBar] with two simple actions. The first action
// // opens a [SnackBar], while the second action navigates to a new page.
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatelessWidget(),
//     );
//   }
// }
//
// /// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AppBar Demo'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.add_alert),
//             tooltip: 'Show Snackbar',
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('This is a snackbar')));
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.navigate_next),
//             tooltip: 'Go to the next page',
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute<void>(
//                 builder: (BuildContext context) {
//                   return Scaffold(
//                     appBar: AppBar(
//                       title: const Text('Next page'),
//                     ),
//                     body: const Center(
//                       child: Text(
//                         'This is the next page',
//                         style: TextStyle(fontSize: 24),
//                       ),
//                     ),
//                   );
//                 },
//               ));
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text(
//           'This is the home page',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
