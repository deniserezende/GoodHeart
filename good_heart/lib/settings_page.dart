import 'package:flutter/material.dart';
import 'package:good_heart/colors.dart';
import 'package:good_heart/main.dart';
import 'dart:io';
import 'globals.dart' as globals;

class SettingsPage extends StatefulWidget {

  // Socket? client;
  Wrapper? socket;
  SettingsPage({Key? key, this.socket}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState(client: this.socket!.client);
}

class _SettingsPageState extends State<SettingsPage> {

  Socket? client;
  _SettingsPageState({this.client});

  Future<void> showAlertNotDeveloped(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Hold on!\nUnfortunately this feature is not yet implemented..."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Maybe next time."),
              )


            ]
          );
    });
  }

  Future<void> infoDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.medical_services_rounded, color: MyColors.red, size: 50.0,),
            content: Text("Version: 1.0 \nDate: 07-10-2021\n", style: TextStyle(height: 1.2, fontSize: 18),),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
              )
            ]
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.01),
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                color: Colors.grey[50],
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.folder),
              //     title: Text('Folder', style: TextStyle(fontSize: 18),),
              //     dense: true,
              //     onTap: () async {
              //       // Navigator.pushNamed(context, '/AQUI');
              //       await showAlertNotDeveloped(context);
              //     },
              //   ),
              //   margin: EdgeInsets.only(left:20, right:20, top: 10),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.chat),
              //     title: Text('Chat', style: TextStyle(fontSize: 18),),
              //     dense: true,
              //     onTap: () async {
              //       // Navigator.pushNamed(context, '/AQUI');
              //       await showAlertNotDeveloped(context);
              //     },
              //   ),
              //   margin: EdgeInsets.only(left:20, right:20, top: 10),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.storage),
              //     title: Text('Storage', style: TextStyle(fontSize: 18),),
              //     dense: true,
              //     onTap: () async {
              //       // Navigator.pushNamed(context, '/AQUI');
              //       await showAlertNotDeveloped(context);
              //     },
              //   ),
              //   margin: EdgeInsets.only(left:20, right:20, top: 10),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Icon(Icons.help),
              //     title: Text('Help', style: TextStyle(fontSize: 18),),
              //     dense: true,
              //     onTap: () async {
              //       // Navigator.pushNamed(context, '/AQUI');
              //       await showAlertNotDeveloped(context);
              //     },
              //   ),
              //   margin: EdgeInsets.only(left:20, right:20, top: 10),
              // ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Info', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: () async {
                    await infoDialog(context);
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
            ],
          )
      ),
    );
  }
}
