import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:trade_chart/candle_data.dart';
import 'package:trade_chart/trade_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nifty 50 Candle Chart',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Nifty 50 Chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CandleData> candleData = [];

  Future<void> loadCandleData() async {
    final String csvData = await rootBundle.loadString('assets/nifty50.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);

    setState(() {
      candleData = csvTable.skip(1).map((row) {
        return CandleData(
          timestamp: DateTime.parse(row[0]).millisecondsSinceEpoch,
          open: double.parse(row[1].toString()),
          high: double.parse(row[2].toString()),
          low: double.parse(row[3].toString()),
          close: double.parse(row[4].toString()),
          volume: double.parse(row[5].toString()),
        );
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadCandleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TradeChart(candleData: candleData),
    );
  }
}
