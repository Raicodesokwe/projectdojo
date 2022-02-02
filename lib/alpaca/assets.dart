class Assets {
  final String name;
  final String symbol;

  const Assets({this.name, this.symbol});
  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(name: json['name'] as String, symbol: json['symbol'] as String);
  }
}