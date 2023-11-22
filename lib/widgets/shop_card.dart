import 'package:flutter/material.dart';
import 'package:kurbanmobile/screens/list_item.dart';
import 'package:kurbanmobile/screens/login.dart';
import 'package:kurbanmobile/screens/shoplist_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: earthToneColor, // Use the specific earth tone color
      child: InkWell(
        onTap: () async{
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
          else if (item.name == "Lihat Produk") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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
