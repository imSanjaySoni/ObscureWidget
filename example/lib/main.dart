import 'package:flutter/material.dart';
import 'package:obscure_widget/obscure_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ObscureWidget examples'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ObscureWidget(
              child: Container(
                width: double.infinity,
                color: Colors.amber,
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Secure Text',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              color: Colors.grey,
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Non-secure Text',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              color: Colors.amber,
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Other Secure Text with extension',
                style: Theme.of(context).textTheme.headline6,
              ),
            ).obscured(blur: 2, blurColor: Colors.red),

            const SizedBox(height: 20),

            // builder example
            ObscureWidget.builder(
              obscureBuilder: (context, isCaptured, child) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: isCaptured ? Colors.red : Colors.green,
                    ),
                  ),
                  child: child,
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Other Secure Text with builder constructor',
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
