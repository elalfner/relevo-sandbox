import 'package:flutter/material.dart';

/// Lists the values the counter had at each Reset, newest first.
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
    required this.history,
    required this.onClear,
  });

  /// The Reset history, newest first.
  final List<int> history;

  /// Called when the person clears the history, so the owner can clear its own
  /// copy.
  final VoidCallback onClear;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<int> _history = List<int>.of(widget.history);

  void _clear() {
    widget.onClear();
    setState(() => _history = const []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
      ),
      body: _history.isEmpty
          ? const Center(child: Text('No resets yet'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    key: const Key('history-list'),
                    itemCount: _history.length,
                    itemBuilder: (context, index) =>
                        ListTile(title: Text('Reset at ${_history[index]}')),
                  ),
                ),
                TextButton(
                  key: const Key('clear-history-button'),
                  onPressed: _clear,
                  child: const Text('Clear history'),
                ),
              ],
            ),
    );
  }
}
