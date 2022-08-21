import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/screen/shopping_cart.dart';

import 'providers/shopping_cart_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Provider Example ${context.watch<Counter>().count}'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${context.watch<Counter>().count}',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Count(),
              ElevatedButton(
                  onPressed: () {
                    context.read<ShoppingCartProvider>().addItem('Bangla'
                        '');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShoppingCart()),
                    );
                  },
                  child: const Text('Shopping Cart'))
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<Counter>().decrement(),
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () => context.read<Counter>().reset(),
              //tooltip: 'Increment',
              child: const Icon(Icons.exposure_zero),
            ),
            FloatingActionButton(
              onPressed: () => context.read<Counter>().increment(),
              //tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}
