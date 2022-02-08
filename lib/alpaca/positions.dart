class Positions {
  final String qty;
  final String symbol;
  final String currentPrice;
  final String changeToday;
  final String avgEntryPrice;

  const Positions({this.qty, this.symbol, this.currentPrice, this.changeToday,this.avgEntryPrice});
  factory Positions.fromJson(Map<String, dynamic> json) {
    return Positions(
        qty: json['qty'] as String,
        symbol: json['symbol'] as String,
        currentPrice: json['current_price'],
        changeToday: json['change_today'],
        avgEntryPrice: json['avg_entry_price']);
  }
}
