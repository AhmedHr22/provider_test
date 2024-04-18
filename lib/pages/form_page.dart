import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/provider/counter_provider.dart';

import 'home_page.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Provider Test : Form Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("in this page you incremen or decrement the counter"),
          Text("${context.watch<CounterProvider>().value}"),
          FloatingActionButton(
            child: const Icon(FontAwesome.plus),
            onPressed: () {
              context.read<CounterProvider>().increment();
            },
          ),
          FloatingActionButton(
            child: const Icon(FontAwesome.minus),
            onPressed: () {
              context.read<CounterProvider>().decrement();
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: Colors.purple.shade200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(
                          title: 'Provider Test:HomePage',
                        ),
                      ));
                },
                child: const Icon(Icons.home)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormPage(),
                      ));
                },
                child: const Icon(Icons.format_align_center))
          ],
        ),
      ),
    );
  }
}
