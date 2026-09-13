import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onTap;
  const CoffeeTile({super.key, required this.coffee, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ), // BoxDecoration
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // coffee pic
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              coffee.imagePath,
              height: 180,
              width: 280,
              fit: BoxFit.cover,
            ),
          ), // ClipRRect

          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              coffee.description,
              style: TextStyle(color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ), // Text
          ), // Padding

          // price + details
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // coffee name
                      Text(
                        coffee.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF2D1E18),
                        ),
                      ), // Text

                      const SizedBox(height: 5),

                      // price
                      Text(
                        '\$${coffee.price} MXN',
                        style: const TextStyle(
                          color: Color(0xFF6F4E37),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ), // Text
                    ],
                  ),
                ), // Column

                // plus button
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: Material(
                    color: const Color(0xFF2D1E18),
                    child: InkWell(
                      onTap: onTap,
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ), // Row
          ), // Padding
        ],
      ), // Column
    ); // Container
  }
}