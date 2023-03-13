import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int _sum = 0;

  Future<void> _sumValues() async {
    const channel = MethodChannel("com.tony/nativo");
    try {
      final sum = await channel.invokeMethod("sumValues", {"a": _a, "b": _b});

      setState(() {
        _sum = sum;
      });
    } on PlatformException catch (e) {
      print(e);
    }
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
                  "O resultado da soma é: $_sum",
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
                  onPressed: _sumValues,
                  child: const Text("Somar"),
                ),
              ],
            ),
          ),
        ));
  }
}
