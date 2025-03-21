import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './viewmodels/counter_viewmodel.dart';
import './views/counter_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterView(),
    );
  }
}
