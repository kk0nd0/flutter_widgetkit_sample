import 'package:flutter/material.dart';
import 'package:flutter_widgetkit_sample/presentation/pages/home_page.dart';
import 'package:flutter_widgetkit_sample/presentation/res/theme.dart';
import 'package:home_widget/home_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeWidget.setAppGroupId('group.sampleWidgetKit');
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'widgetkit',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
