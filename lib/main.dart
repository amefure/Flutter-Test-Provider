import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ChangeNotifier/counter_viewmodel.dart';
import 'ChangeNotifier/counter_change_notifier_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      // ValueNotifier(デフォルト)
      // home: CounterValueNotifierView(),
      // ChangeNotifier(Provider)
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterViewModel()),
        ],
        child: CounterChangeNotifierView(),
      ),
    );
  }
}
