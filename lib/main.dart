import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _a = 0;
  int _b = 0;
  int sum = 0;

  void sumValues() {
    setState(() {
      sum = _a + _b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Código Nativo no Flutter"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "O resultado da soma é: $sum",
                  style: const TextStyle(fontSize: 20),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => _a = int.tryParse(value) ?? 0),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => _b = int.tryParse(value) ?? 0),
                ),
                ElevatedButton(
                  onPressed: sumValues,
                  child: const Text("Somar"),
                ),
              ],
            ),
          ),
        ));
  }
}
