import 'package:flutter/material.dart';
import 'package:flutter_mobile/widgets/my_footer.dart';
import 'package:flutter_mobile/widgets/my_header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String fullname = 'AomKung';
  var products = {
    'id': 1,
    'product1': 'Apple',
    'product2': 'Banana',
    'product3': 'Orange',
  };

  void _incrementCounter() {
    setState(() {
      _counter++;
      fullname = 'John Doe';
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = 20;

    ///print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', width: 50, height: 50),
        centerTitle: true,
        //const Text('Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyHeader(
              title: 'Test Header 1',
            ),
            const MyHeader(
              title: 'Header test2',
            ),
            const MyHeader(
              title: 'Header test3',
            ),
            const MyFooter(),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              fullname,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
