import 'candle_data.dart';

class IndicatorCalculator {
  static Map<int, double?> calculateMA(List<CandleData> data, int period) {
    Map<int, double?> result = {};
    if (data.length < period * 2) return result;

    double ma =
        data.take(period).map((d) => d.close).reduce((a, b) => a + b) / period;

    for (int i = 0; i < period; i++) {
      result[data[i].timestamp] = null;
    }

    for (int i = period; i < data.length; i++) {
      final curr = data[i].close;
      final prev = data[i - period].close;
      ma = (ma * period + curr - prev) / period;
      result[data[i].timestamp] = ma;
    }

    return result;
  }

// Add more indicator calculations as needed
}
