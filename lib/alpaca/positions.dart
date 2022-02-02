class Positions {
  final String qty;
  final String symbol;
  final String currentPrice;
  final String changeToday;

  const Positions({this.qty, this.symbol, this.currentPrice, this.changeToday});
  factory Positions.fromJson(Map<String, dynamic> json) {
    return Positions(
        qty: json['qty'] as String,
        symbol: json['symbol'] as String,
        currentPrice: json['current_price'],
        changeToday: json['change_today']);
  }
}
