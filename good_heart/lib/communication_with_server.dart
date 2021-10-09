import 'dart:convert';

CommunicationWithServer communicationWithServerFromJson(String str) => CommunicationWithServer.fromJson(json.decode(str));

String communicationWithServerToJson(CommunicationWithServer data) => json.encode(data.toJson());

class CommunicationWithServer {

  dynamic IdMsg;
  dynamic OpCode;
  dynamic ECGTime;
  dynamic ECGFile;
  dynamic FreqCard;
  dynamic GoodComplex;
  dynamic BadComplex;
  dynamic ECGFileName;

  CommunicationWithServer({this.IdMsg, this.OpCode, this.ECGTime, this.ECGFile, this.FreqCard, this.GoodComplex, this.BadComplex, this.ECGFileName});

  String toJson() {
    var data = <String, dynamic>{};
    data["IdMsg"] = this.IdMsg;
    data["OpCode"] = this.OpCode;
    data["ECGTime"] = this.ECGTime;
    data["ECGFile"] = this.ECGFile;
    data["FreqCard"] = this.FreqCard;
    data["GoodComplex"] = this.GoodComplex;
    data["BadComplex"] = this.BadComplex;
    data["ECGFileName"] = this.ECGFileName;
    return jsonEncode(data);
  }

  factory CommunicationWithServer.fromJson(Map<String, dynamic> json) =>
      CommunicationWithServer(
        IdMsg: json["IdMsg"],
        OpCode: json["OpCode"],
        ECGTime: json["ECGTime"],
        ECGFile: json["ECGFile"],
        FreqCard: json["FreqCard"],
        GoodComplex: json["GoodComplex"],
        BadComplex: json["BadComplex"],
        ECGFileName: json["ECGFileName"],
      );
}