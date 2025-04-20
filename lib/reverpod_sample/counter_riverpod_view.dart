import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 状態管理（StateProvider を使用）
final counterProvider = StateProvider<int>((ref) => 0);

/// カウンター機能UI
class CounterRiverpodView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider); // 値の監視

    return Scaffold(
      appBar: AppBar(title: const Text('Counter with Riverpod')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter Value', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),

            Text(
              '$count',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // デクリメントボタン
                DecrementButton(),
                const SizedBox(width: 20),
                // インクリメントボタン
                IncrementButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 最大カウント数
final int MAX_COUNT = 10;

/// インクリメント可能かどうかを計算するプロバイダ
final canIncrementProvider = Provider<bool>((ref) {
  return ref.watch(counterProvider) != MAX_COUNT;
});

/// インクリメントボタン
/// Providerを使用して[canIncrementProvider]に検知ロジックを切り離す
class IncrementButton extends ConsumerWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// インクリメント可能かどうか
    /// watchで常に変化を観測し、変化するたびに再描画
    final canIncrement = ref.watch(canIncrementProvider);
    /// インクリメント
    void increment() {
      ref.read(counterProvider.notifier).update((state) => state + 1);
    }
    /// ボタンUI
    return ElevatedButton(
      onPressed: canIncrement ? increment : null,
      child: const Icon(Icons.add),
    );
  }
}

/// デクリメントボタン
/// この実装ではパフォーマンスに問題あり
class DecrementButton extends ConsumerWidget {
  const DecrementButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// デクリメント可能かどうか
    /// watchで常に変化を観測し、変化するたびに再描画
    final canDecrement = ref.watch(counterProvider) > 0;
    /// デクリメント
    void decrement() {
      ref.read(counterProvider.notifier).update((state) => state - 1);
    }
    /// ボタンUI
    return ElevatedButton(
      onPressed: canDecrement ? decrement : null,
      child: const Icon(Icons.remove),
    );
  }
}
