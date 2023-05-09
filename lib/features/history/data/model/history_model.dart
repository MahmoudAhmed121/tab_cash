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
        toWallet: json["to_wallet"] != null ? json["to_wallet"] : null,
        type: json["type"],
        amount: json["amount"],
        dateCreated: DateTime.parse(json["date_created"]),
      );
}
