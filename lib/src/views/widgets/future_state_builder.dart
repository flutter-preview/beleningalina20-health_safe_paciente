import 'package:flutter/material.dart';

class FutureStateBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  const FutureStateBuilder({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            if (true) {}
          }

          if (snapshot.hasError) {}

          return Center(child: CircularProgressIndicator());
        });
  }
}
