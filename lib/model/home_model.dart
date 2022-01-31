import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final counterNotifierProvider = StateNotifierProvider<HomeModel, int>(
  (ref) => HomeModel(),
);

class HomeModel extends StateNotifier<int> {
  HomeModel() : super(0);

  Future<void> increase() async {
    int? count = state++;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter_key', count + 1);
    try {
      await HomeWidget.saveWidgetData<int>('counter_key', count + 1);
      final result = await _updateWidget();
      print(result);
    } on PlatformException catch (e) {
      print('${e.message}');
    }
  }

  Future<bool?> _updateWidget() async {
    try {
      return HomeWidget.updateWidget(iOSName: 'CounterWidget');
    } on PlatformException catch (exception) {
      print('Error Updating Widget. $exception');
    }
  }
}
