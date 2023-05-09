class TranseferSucessModel {
  String id;
  String toWallet;
  dynamic toKidWallet;
  String type;
  String amount;
  String number;
  DateTime dateCreated;
  String wallet;
  dynamic kidWallet;

  TranseferSucessModel({
    required this.id,
    required this.toWallet,
    this.toKidWallet,
    required this.type,
    required this.amount,
    required this.number,
    required this.dateCreated,
    required this.wallet,
    this.kidWallet,
  });

  factory TranseferSucessModel.fromJson(Map<String, dynamic> json) => TranseferSucessModel(
    id: json["id"],
    toWallet: json["to_wallet"],
    toKidWallet: json["to_kid_wallet"] != null ?json["to_kid_wallet"]: null ,
    type: json["type"],
    amount: json["amount"],
    number: json["number"],
    dateCreated: DateTime.parse(json["date_created"]),
    wallet: json["wallet"],
    kidWallet: json["kid_wallet"],
  );

}