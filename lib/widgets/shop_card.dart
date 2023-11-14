import 'package:flutter/material.dart';
import 'package:kurbanmobile/screens/shoplist_form.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard({required this.item, Key? key}) : super(key: key);

  Color _getEarthToneColor(String itemName) {
    switch (itemName) {
      case "Lihat Produk":
        return Colors.brown[300]!; // A lighter brown
      case "Tambah Produk":
        return Colors.green[400]!; // A green, still earthy
      case "Logout":
        return Colors.orange[600]!; // An orange, reminiscent of clay
      default:
        return Colors.grey; // Fallback color
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the earth tone color specific to this item
    final Color earthToneColor = _getEarthToneColor(item.name);

    return Material(
      color: earthToneColor, // Use the specific earth tone color
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Produk") {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
