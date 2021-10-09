import 'package:flutter/material.dart';
import 'colors.dart';

class DefaultHomePage extends StatefulWidget {
  @override
  _DefaultHomePage createState() => _DefaultHomePage();
}

class _DefaultHomePage extends State<DefaultHomePage> {
  @override
  Widget build(BuildContext context) {

    // FRAME
    var screenSize = MediaQuery.of(context).size;

    final double appBarHeight = screenSize.height * 0.15;

    return Scaffold(
      // INSTRUCTIONS
        body: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Stack(
                 children: <Widget>[
                      ListView(
                          children: <Widget> [
                            Card(
                              child: Padding(
                                padding: EdgeInsets.only(top: appBarHeight, left: 30, right: 30),
                                child: Text("Follow the instructions: \n",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1.2, fontSize: 20),
                                ),
                              ),
                              shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                              color: Colors.grey[50],
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text("1. Click the “Device” button bellow and then click “Connect to Device”.\n",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1.2, fontSize: 20),
                                ),
                              ),
                              shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                              color: Colors.grey[50],
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text("If the connection was successful then you can start an evaluation:\n",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1.2, fontSize: 20),
                                ),
                              ),
                              shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                              color: Colors.grey[50],
                            ),
                            Card(
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text("2. To start an evaluation of an ECG, click the “Evaluation” button bellow.\n",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1.2, fontSize: 20),
                                ),
                              ),
                              shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                              color: Colors.grey[50],
                            ),
                          ],
                    ),


                  // UPPER NAVIGATION BAR
                  Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                      ),
                      child: Container(
                          width: screenSize.width,
                          height: appBarHeight, // AQUI
                          decoration: BoxDecoration(
                            color: MyColors.green,
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: screenSize.width * 0.05,
                                top: screenSize.height * 0.05,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: screenSize.width * 0.2,
                                    height: screenSize.height * 0.2, // AQUI
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                      // AQUI pesquisar como fazer com path relativo
                                      image: AssetImage(
                                          "assets/images/AppIcon/GreenIconGoodHeartNoBackground.png"),
                                    )),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Center(
                                          child: Text(
                                        'Good Heart',
                                        style: TextStyle(
                                            //fontFamily: 'ComicSans', //AQUI ver como trocar fonte
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      )))
                                ],
                              )
                          )
                      )
                  ),
              ]
            )
        ),

        // BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            //if (value == 0) Navigator.pushNamed(context, '/connection_page');
            if (value == 1) Navigator.pushNamed(context, '/connection_page');
            if (value == 2) Navigator.pushNamed(context, '/evaluation_page');
            if (value == 3) Navigator.pushNamed(context, '/settings_page');
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.router_rounded),
              label: 'Device',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: 'Evaluation', //AQUI centralizar
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            ),
          ],
          showUnselectedLabels: true,
          unselectedItemColor: MyColors.green,
          selectedItemColor: MyColors.red,
          // selectedLabelStyle: TextStyle(fontSize: 15), //AQUI deletar isso?

        )
    );
  }
}

