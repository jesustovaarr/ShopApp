import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/coffee_tile.dart';
import '../models/cart.dart';
import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addCoffeeToCart(Coffee coffee) {
    Provider.of<Cart>(context, listen: false).addItemToCart(coffee);

    // alert the user, coffee successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFF5F2EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '¡Añadido a tu pedido!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D1E18),
          ),
        ),
        content: const Text(
          'Revisa tu carrito para disfrutar de este café.',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Aceptar',
              style: TextStyle(
                color: Color(0xFF2D1E18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ), // BoxDecoration
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buscar café o método...',
                  style: TextStyle(color: Colors.grey.shade500),
                ), // Text
                Icon(
                  Icons.search,
                  color: Colors.brown.shade400,
                ), // Icon
              ],
            ), // Row
          ), // Container

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Text(
              'mientras la lluvia cae afuera.. el aroma a café lo reconforta todo',
              style: TextStyle(
                color: Colors.brown.shade600,
                fontStyle: FontStyle.italic,
                fontSize: 13,
              ),
            ), // Text
          ), // Padding

          // hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Selección de la Finca',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xFF2D1E18),
                  ),
                ), // Text
                Text(
                  'Ver todo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F4E37),
                  ),
                ), // Text
              ],
            ), // Row
          ), // Padding

          const SizedBox(height: 12),

          // list of coffee for sale
          Expanded(
            child: ListView.builder(
              itemCount: value.getCoffeeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a coffee from shop list
                Coffee coffee = value.getCoffeeList()[index];

                // return the coffee tile
                return CoffeeTile(
                  coffee: coffee,
                  onTap: () => addCoffeeToCart(coffee),
                ); // CoffeeTile
              },
            ), // ListView.builder
          ), // Expanded

          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ), // Divider
          ), // Padding
        ],
      ), // Column
    ); // Consumer
  }
}