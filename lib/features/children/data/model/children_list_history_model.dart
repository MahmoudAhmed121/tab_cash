class ChildrenListHistoryModel {
  String id;
  String wallet;
  dynamic kidWallet;
  dynamic toWallet;
  String toKidWallet;
  String type;
  String amount;
  String number;
  DateTime dateCreated;

  ChildrenListHistoryModel({
    required this.id,
    required this.wallet,
    this.kidWallet,
    this.toWallet,
    required this.toKidWallet,
    required this.type,
    required this.amount,
    required this.number,
    required this.dateCreated,
  });

factory ChildrenListHistoryModel.fromJson(Map<String, dynamic> json) => ChildrenListHistoryModel(
  id: json["id"],
  wallet: json["wallet"],
  kidWallet: json["kid_wallet"],
  toWallet: json["to_wallet"] != null ? json["to_wallet"] : null,
  toKidWallet: json["to_kid_wallet"] != null ? json["to_kid_wallet"] : null,
  type: json["type"],
  amount: json["amount"],
  number: json["number"],
  dateCreated: DateTime.parse(json["date_created"]),
);
}
