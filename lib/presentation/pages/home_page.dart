import 'package:flutter/material.dart';
import 'package:flutter_widgetkit_sample/model/home_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterNotifierProvider.notifier);
    final count = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text('$count')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
