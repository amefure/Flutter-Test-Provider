import 'package:flutter/material.dart';

/// Dart標準の[ValueNotifier]を使用した方法
/// 単一の値だけを管理する際に活用できる
class CounterValueNotifierView extends StatelessWidget {

  final counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),

            // ValueListenableBuilderが変更を検知し、UIに反映
            ValueListenableBuilder<int>(
              valueListenable: counter,
              builder: (context, value, _) {
                return Text(
                  '${counter.value}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),

            const SizedBox(height: 20),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // デクリメントボタン
                FloatingActionButton(
                  onPressed: () => counter.value--,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                // インクリメントボタン
                FloatingActionButton(
                  onPressed: () => counter.value++,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
