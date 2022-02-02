class Account {
  final String cash;
  final String portfolioValue;
  final String buyingPower;
  final String longMarketValue;

  const Account({this.cash, this.portfolioValue, this.buyingPower,this.longMarketValue});
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        cash: json['cash'] as String,
        portfolioValue: json['portfolio_value'],
        buyingPower: json['buying_power'],
        longMarketValue: json['long_market_value']);
  }
}
