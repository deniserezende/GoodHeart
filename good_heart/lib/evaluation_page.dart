import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:good_heart/communication_with_server.dart';
import 'package:good_heart/connection_page.dart';
import 'main.dart';
import 'globals.dart' as globals;
import 'package:logger/logger.dart';

var logger = Logger(
  filter: null,
  printer: PrettyPrinter(),
  output: null,
);

var LoggerClass = "EvaluationPage";

class EvaluationPage extends StatefulWidget {

  // Socket? client;
  Wrapper? socket;
  EvaluationPage({Key? key, this.socket}) : super(key: key);

  @override
  _EvaluationState createState() => _EvaluationState(this.socket);
}

class _EvaluationState extends State<EvaluationPage> {
  Wrapper? socket;

  var _listOfFiles = [];
  String? chosenFileName;
  CommunicationWithServer _serverEval = CommunicationWithServer();


  _EvaluationState(Wrapper? socket){
    this.socket = socket;
    if(globals.isConnected == 1){
      startSocketListenInEvaluationPage();
    }
  }

  void startSocketListenInEvaluationPage(){
    socket!.listener.listen((List<int> bytes) async {
        logger.d("[$LoggerClass] Bytes list of files: $bytes");

        var stringBytesReceived = new String.fromCharCodes(bytes).trim();
        logger.d("[$LoggerClass] Getting from server: $stringBytesReceived");

        var receivedFromServer = CommunicationWithServer.fromJson(jsonDecode(stringBytesReceived));

        switch(receivedFromServer.OpCode){
          case 610:
            var listOfFiles = jsonToList(stringBytesReceived);
            setState(() {
              _listOfFiles = listOfFiles;
              logger.d("[$LoggerClass] Ecg list of files from json: $_listOfFiles");
            });
            await askForFile(context);
            // send to server in Json format
            if (chosenFileName != null) {
              logger.d("[$LoggerClass] chosenFileName: $chosenFileName");
              globals.idMsgValue += 1;
              var fileChoice = CommunicationWithServer(IdMsg: globals.idMsgValue, OpCode: 100, ECGFile: chosenFileName);
              socket!.client!.write(fileChoice.toJson());
            }
            break;

          case 400:
            setState(() {
              _serverEval = receivedFromServer;
            });
            await showServerEvaluation(context);
            break;

          default:
            logger.d("[$LoggerClass] Sent from server unknown OpCode");
            break;
        }
      },

      onError: (error, StackTrace trace) async {
        logger.e("[$LoggerClass] Error retriving ecg files: $error\n$trace");
      },

      cancelOnError: false

    );
  }


  Future<void> askForFile(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context,setState){
            return AlertDialog(
                  content: Container (
                    height: 300.0, // Change as per your requirement
                    width: 300.0,
                    padding: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: _listOfFiles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Icon(Icons.description_rounded),
                            title: Text(_listOfFiles[index].toString(),
                                style: TextStyle(height: 1.2, fontSize: 18)),
                            dense: true,
                            onTap: () {
                              chosenFileName = _listOfFiles[index].toString();
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      },
                    )
                  ),
              actions: <Widget>[
                TextButton(
                  child: Text('Back'),
                  onPressed: (){
                    chosenFileName = null;
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          });
        });
  }

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

  Future<void> showServerEvaluation(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Evaluation ready!", textAlign: TextAlign.center,
                style: TextStyle(height: 2.5, fontSize: 20)),
              actions: <Widget> [
                // Card(
                //   child: ListTile(
                //     leading: Icon(Icons.timer),
                //     title: Text("ECG time: " + _serverEval.ECGTime.toString(),
                //     style: TextStyle(height: 0, fontSize: 18),),
                //     dense: true,
                //   ),
                //   margin: EdgeInsets.only(left:20, right:20, top: 0),
                //   elevation: 0.0,
                // ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.medical_services_rounded),
                    title: Text("Heart rate: " + _serverEval.FreqCard.toString() + " bpm",
                        style: TextStyle(height: 0, fontSize: 18)),
                    dense: true,
                  ),
                  margin: EdgeInsets.only(left:20, right:20, top: 10),
                  elevation: 0.0,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.sentiment_very_satisfied_rounded),
                    title: Text("Good complex: " + _serverEval.GoodComplex.toString(),
                        style: TextStyle(height: 0, fontSize: 18)),
                    dense: true,
                  ),
                  margin: EdgeInsets.only(left:20, right:20, top: 10),
                  elevation: 0.0,
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.sentiment_very_dissatisfied),
                    title: Text("Bad complex: " + _serverEval.BadComplex.toString(),
                        style: TextStyle(height: 0, fontSize: 18)),
                    dense: true,
                  ),
                  margin: EdgeInsets.only(left:20, right:20, top: 10),
                  elevation: 0.0,
                ),

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

  Future<void> showAlertWifiNotConnected(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("You are not connected to a host."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConnectionPage(socket: socket,)));

                  },
                  child: Text("Connect now."),
              )


            ]
          );
    });
  }

  jsonToList(String response) {    
    var responseDecoded = CommunicationWithServer.fromJson(jsonDecode(response));
    var files = responseDecoded.Files as List;
    logger.d("[$LoggerClass] Response from server files: $files");

    return files;
  }
  

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluation'),
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
                        Card(
                            child: ListTile(
                              leading: Icon(Icons.add_circle, size: 40,),
                              title: Text('Capture new ECG', style: TextStyle(height: 1.4, fontSize: 20),),
                              subtitle: Text('Capture new ECG by placing sensors all over patients chest.', style: TextStyle(height: 1.3),),
                              isThreeLine: true,
                              onTap: () async {
                                await showAlertNotDeveloped(context);
                              },
                          ),
                          margin: EdgeInsets.only(left:20, right:20, top: 10),
                        ),
                        // Card(
                        //     child: ListTile(
                        //       leading: Icon(Icons.pageview, size: 40,),
                        //       title: Text('Patient captured ECG', style: TextStyle(height: 1.4, fontSize: 20),),
                        //       subtitle: Text('Evaluates an ECG already captured from the patient.', style: TextStyle(height: 1.3),),
                        //       isThreeLine: true,
                        //       onTap: () async {
                        //         await showAlertNotDeveloped(context);
                        //         // var fileChoice = CommunicationWithServer(IdMsg: null, OpCode: 300, ECGFile: _textEditingController.text);
                        //         // client!.write(fileChoice.toJson());
                        //       },
                        //   ),
                        //   margin: EdgeInsets.only(left:20, right:20, top: 10),
                        // ),
                        Card(
                          child: ListTile(
                            leading: FittedBox(
                              child: Icon(Icons.folder, size: 40,),
                              fit: BoxFit.fitHeight,
                            ),
                            title: Text('Find an ECG file', style: TextStyle(height: 1.4, fontSize: 20),),
                            subtitle: Text('Find a previously generated file with ECG info.', style: TextStyle(height: 1.3),),
                            isThreeLine: true,
                            onTap: () async {
                              try {
                                globals.idMsgValue += 1;
                                var sendToServer = CommunicationWithServer(IdMsg: globals.idMsgValue, OpCode: 600);
                                var sendToServerJson = sendToServer.toJson();
                                socket!.client!.write(sendToServerJson);
                                logger.d("[$LoggerClass] Sending ecg file request to server: $sendToServerJson");

                                

                              }catch(_) {
                                await showAlertWifiNotConnected(context); // Nao necessariamente o problema vai ser o wifi nao conectado, pode ser qlqlr coisa que saia do try
                              }

                            },
                          ),
                          margin: EdgeInsets.only(left:20, right:20, top: 10),
                        ),
                      ],
              ),
            ),
    );
  }
}