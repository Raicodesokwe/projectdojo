import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:projectdojo/alpaca/account.dart';
import 'package:projectdojo/alpaca/positions.dart';

import 'assets.dart';

class Debouncer {
  int milliseconds;
  VoidCallback action;
  Timer timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class TradingService {
  Response response;
  Dio dio = Dio();
  String baseUrl =
      "https://us-central1-projectdojo-c033f.cloudfunctions.net/nyap/";
  Future<Account> getAccount(context) async {
    try {
      response = await dio.get(baseUrl + "get_account");
      print(response.data.toString());
    } on DioError catch (e) {
    
    }
    return Account.fromJson(json.decode(response.data));
  }

  Future<List<Assets>> getAssets({String query}) async {
    List<Assets> weka = [];
    try {
      response = await dio.get(baseUrl + "get_assets");
      print(response.data.toString());
      final List stonks = json.decode(response.data);
      weka = stonks.map((json) => Assets.fromJson(json)).toList();
    } on DioError catch (e) {}
    return weka;
  }
  

  buyStock(context, symbol) async {
    try {
      response = await dio
          .get(baseUrl + "buy_stock", queryParameters: {'symbol': symbol});
      print(response.data.toString());
    } on DioError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }

  stockInfo(context, symbol) async {
    try {
      response = await dio
          .get(baseUrl + "stock_info", queryParameters: {'symbol': symbol});
      print(response.data.toString());
    } on DioError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }

 Future<List<Positions>> getPositions(context) async {
   List<Positions> doro = [];
    try {
      response = await dio.get(baseUrl + "get_positions");
      print(response.data.toString());
      final List positions = json.decode(response.data);
      doro=positions.map((json) => Positions.fromJson(json)).toList();
    } on DioError catch (e) {
   
    }
    return doro;
  }

  sellPosition(context, symbol) async {
    try {
      response = await dio
          .get(baseUrl + "sell_position", queryParameters: {'symbol': symbol});
      print(response.data.toString());
    } on DioError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }
}
