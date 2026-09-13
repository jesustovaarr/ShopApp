import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/coffee.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading
            const Text(
              'Mi Pedido',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF2D1E18),
              ),
            ), // Text

            const SizedBox(height: 12),

            Expanded(
              child: value.getUserCart().isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.coffee_outlined,
                            size: 64,
                            color: Colors.brown.shade300,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Aún no has agregado cafés a tu pedido.',
                            style: TextStyle(
                              color: Colors.brown.shade400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: value.getUserCart().length,
                      itemBuilder: (context, index) {
                        // get individual coffee
                        Coffee individualCoffee = value.getUserCart()[index];

                        // return the cart item
                        return CartItem(coffee: individualCoffee);
                      },
                    ), // ListView.builder
            ), // Expanded
          ],
        ), // Column
      ), // Padding
    ); // Consumer
  }
}