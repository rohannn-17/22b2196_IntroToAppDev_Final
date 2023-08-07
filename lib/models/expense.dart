class Expense {
  String category;
  String expense;

  Expense({required this.category, required this.expense});

  Map<String, dynamic> toMap() {
    return {'category': category, 'expense': expense};
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      category: json['category'],
      expense: json['expense'],
    );
  }
}
