// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModel {
    String id;
    String wallet;
    String? toWallet;
    String type;
    String amount;
    DateTime dateCreated;

    HistoryModel({
        required this.id,
        required this.wallet,
        this.toWallet,
        required this.type,
        required this.amount,
        required this.dateCreated,
    });

    factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json["id"],
        wallet: json["wallet"],
        toWallet: json["to_wallet"],
        type: json["type"],
        amount: json["amount"],
        dateCreated: DateTime.parse(json["date_created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "wallet": wallet,
        "to_wallet": toWallet,
        "type": type,
        "amount": amount,
        "date_created": dateCreated.toIso8601String(),
    };
}
