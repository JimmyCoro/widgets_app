import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text('circular progress'),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black12,
        ),
        SizedBox(height: 20),
        Text('Circular  Indicator controlado'),
        SizedBox(
          height: 10,
        ),
        _ControlledProgressIndicator()
      ]),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.black38,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue
              ))
            ]),
          );
        });
  }
}
