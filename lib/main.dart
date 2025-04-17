import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/change_notifier_sample/counter_change_notifier_view.dart';
import 'package:test_provider/change_notifier_sample/counter_viewmodel.dart';
import 'package:test_provider/reverpod_sample/counter_riverpod_view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      // ====================  Riverpod  =======================
      home: CounterRiverpodView(),

      // =============  ValueNotifier(デフォルト) ================
      // home: CounterValueNotifierView(),

      // =============  ChangeNotifier(Provider) ===============
      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => CounterViewModel()),
      //   ],
      //   child: CounterChangeNotifierView(),
      // ),
    );
  }
}
