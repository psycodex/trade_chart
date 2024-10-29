import 'package:flutter/material.dart';

import 'candle_data.dart';
import 'indicator.dart';

class TradeChart extends StatefulWidget {
  final List<CandleData> candleData;
  final Map<String, Indicator> indicators;

  TradeChart({
    required this.candleData,
    Map<String, Indicator>? indicators,
  }) : this.indicators = indicators ?? {};

  void addIndicator(String key, Indicator indicator) {
    indicators[key] = indicator;
  }

  void removeIndicator(String key) {
    indicators.remove(key);
  }

  void updateIndicator(String key, Indicator newIndicator) {
    if (indicators.containsKey(key)) {
      indicators[key] = newIndicator;
    }
  }

  List<Indicator> get overlayIndicators =>
      indicators.values.where((i) => i.isOverlay).toList();

  List<Indicator> get separateIndicators =>
      indicators.values.where((i) => !i.isOverlay).toList();

  @override
  State<StatefulWidget> createState() => _TradeChartState();
}

class _TradeChartState extends State<TradeChart> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
