class QuizRequest {
  int amount;
  int category;
  String difficulty;
  String type;

  QuizRequest({this.amount, this.category, this.difficulty, this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['category'] = this.category;
    data['difficulty'] = this.difficulty;
    data['type'] = this.type;
    return data;
  }
}
