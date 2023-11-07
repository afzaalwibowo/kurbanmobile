# 🏪 KurbanMobile Store

## Tugas 7


### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
1. **StatelessWidget**
    - **Statis**: `StatelessWidget` adalah widget yang tidak berubah; setelah dibuat, properti dan konfigurasinya tetap sama.
    - **Efisien**: Tanpa manajemen state, widget ini cepat dibuat ulang.
    - **Penggunaan**: Ideal untuk elemen UI yang tetap, seperti ikon, teks, dan gambar statis.
2. **StatefulWidget**
    - **Dinamis**: `StatefulWidget` dapat mengubah state-nya, memperbarui UI berdasarkan interaksi pengguna atau data eksternal.
    - **Kompleksitas**: Memerlukan manajemen state yang lebih rumit, yang bisa memengaruhi kinerja.
    - **Manajemen State**: Memiliki objek state yang mempertahankan state melalui hot reload dan pembuatan ulang widget.
    - **Penggunaan**: Tepat untuk elemen UI yang interaktif atau yang memerlukan pembaruan data, seperti formulir, animasi, atau timer.

### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. **MyHomePage:** Ini adalah kelas yang merepresentasikan halaman utama aplikasi. Diwarisi dari StatelessWidget, artinya tidak menyimpan state.
2. **Scaffold:** Widget yang memberikan struktur dasar untuk tampilan visual aplikasi seperti AppBar, body, dan floatingActionButton.
3. **AppBar:** Sebuah app bar dengan desain Material, digunakan untuk menampilkan judul aplikasi, branding, atau navigasi.
4. **Text:** Widget yang menampilkan teks dengan gaya yang bisa disesuaikan.
5. **SingleChildScrollView:** Widget scrollable untuk konten yang lebih besar daripada layar.
6. **Padding:** Widget yang memberikan ruang di sekitar widget anaknya.
7. **Column:** Menampilkan anak-anaknya dalam susunan vertikal.
8. **GridView:** Menampilkan widget anaknya dalam bentuk grid yang bisa discroll.
9. **ShopCard:** Widget kustom yang menerima objek ShopItem dan menampilkannya dalam bentuk card.
10. **Material:** Widget yang menerapkan visual Material Design.
11. **InkWell:** Widget yang memberikan efek visual ketika disentuh.
12. **Container:** Widget yang menggabungkan beberapa widget menjadi satu dan bisa dikonfigurasi untuk padding, margin, dan lainnya.
13. **Icon:** Menampilkan ikon Material Design.
14. **Center:** Widget yang memposisikan anaknya tepat di tengah.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. **Membuat Program Flutter Baru dengan Tema Inventory**
    - Jalankan perintah `flutter create kurbanmobile` untuk memulai proyek Flutter.
    - Navigasi ke direktori proyek dengan `cd kurbanmobile`.
2. **Membuat Tiga Tombol Sederhana dengan Ikon dan Teks**
    - Ubah `main.dart` dengan mengganti `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.
    - Di `menu.dart`:
        - Definisikan tipe data untuk item yang akan dijual:
        ```
        class ShopItem {
            final String name;
            final IconData icon;

            ShopItem(this.name, this.icon);
        }
        ```
        - Modifikasi widget halaman menjadi stateless dan sesuaikan konstruktor:
        ```
        ({Key? key}) : super(key: key);
        ```
        - Daftar barang yang akan dijual:
        ```
        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist),
            ShopItem("Tambah Item", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];
        ```
        - Atur `@override Widget build(BuildContext context)`:
        ```
        // Kode Scaffold, SingleChildScrollView, Padding, Column, GridView di sini
        ```
        - Buat `ShopCard` sebagai widget stateless baru:
        ```
        class ShopCard extends StatelessWidget {
            // Constructor dan method build di sini
        }
        ```
3. **Menampilkan Snackbar**
    - Di `menu.dart`, tambahkan pada `ShopCard`:
    ```
    @override
    Widget build(BuildContext context){
        return Material(
           

 ...
            child: InkWell(
                onTap: () {
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                ...
            )
        );
    }
    ```

### Bonus
- Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).

    Di `menu.dart` pada `class ShopCard extends StatelessWidget`gunakan logika if-else agar warna button untuk setiap tombolnya berbeda pada method override berikut:
    ```
    Color _getEarthToneColor(String itemName) {
    switch (itemName) {
      case "Lihat Produk":
        return Colors.brown[300]!; 
      case "Tambah Produk":
        return Colors.green[400]!; 
      case "Logout":
        return Colors.orange[600]!; 
      default:
        return Colors.grey; 
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the earth tone color specific to this item
    final Color earthToneColor = _getEarthToneColor(item.name);
    . . .
    ```
    
