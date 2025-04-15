import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_viewmodel.dart';

class CounterChangeNotifierView extends StatelessWidget {
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

            // Consumer を使って ViewModel の値を UI に反映
            Consumer<CounterViewModel>(
              builder: (context, viewModel, child) {
                return Text(
                  '${viewModel.count}',
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
                  onPressed: () => context.read<CounterViewModel>().decrement(),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                // インクリメントボタン
                FloatingActionButton(
                  onPressed: () => context.read<CounterViewModel>().increment(),
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
