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
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                'Other Secure Text',
                style: Theme.of(context).textTheme.headline6,
              ),
            ).obscured(blur: 2, blurColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
