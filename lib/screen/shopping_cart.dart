import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_example/providers/shopping_cart_provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${context.watch<ShoppingCartProvider>().cart}'),
            Text('${context.watch<ShoppingCartProvider>().count}'),
          ],
        ),
      ),
    );
  }
}
