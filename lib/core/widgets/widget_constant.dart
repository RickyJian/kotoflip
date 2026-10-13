class WidgetConstant {
  WidgetConstant._internal();

  static final WidgetConstant _instance = WidgetConstant._internal();

  factory WidgetConstant() => _instance;

  // card/dialog
  static const int horizontalPadding = 20;
  static const int verticalPadding = 5;
  static const double elevation = 4;
  static const int cardBorderRadius = 12;
}
