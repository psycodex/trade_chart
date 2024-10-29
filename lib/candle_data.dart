class CandleData {
  final int timestamp;
  final double open;
  final double high;
  final double low;
  final double close;
  final double? volume;
  final double? change;

  CandleData({
    required this.timestamp,
    required this.open,
    required this.close,
    required this.volume,
    required this.high,
    required this.low,
    this.change,
  });

// Move MA computation to a separate IndicatorCalculator class
}
