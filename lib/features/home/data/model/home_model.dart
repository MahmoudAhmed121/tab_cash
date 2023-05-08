class StatisModel {
  int incomes;
  int expenses;

  StatisModel({
    required this.incomes,
    required this.expenses,
  });

  factory StatisModel.fromJson(Map<String, dynamic> json) {
    return StatisModel(
      incomes: json["incomes"] != null ? json["incomes"] as int : 0,
      expenses: json["expenses"] != null ? json["expenses"] as int : 0,
    );
  }
}