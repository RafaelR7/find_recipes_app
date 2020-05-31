class IngredientModel {
  String name;
  String original;
  double amount;
  String unit;

  IngredientModel({
    this.name,
    this.original,
    this.amount,
    this.unit,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> parsedJson) {
    return IngredientModel(
      name: parsedJson['name'],
      original: parsedJson['original'],
      amount: parsedJson['amount'],
      unit: parsedJson['unit'],
    );
  }

  @override
  String toString() {
    return 'name: $name, original: $original, amount: $amount, unit: $unit';
  }
}
