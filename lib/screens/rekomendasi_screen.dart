import 'package:flutter/material.dart';

class RekomendasiScreen extends StatefulWidget {
  const RekomendasiScreen({Key? key}) : super(key: key);

  @override
  _RekomendasiScreenState createState() => _RekomendasiScreenState();
}

class _RekomendasiScreenState extends State<RekomendasiScreen> {
  List<Product> _products = [
    Product(
      name: "Acne Treatment Serum",
      description: "Serum khusus untuk mengatasi jerawat",
      imagePath: "assets/images/Acneserum.jpg",
    ),
    Product(
      name: "Daily Moisturizer",
      description: "Pelembap sehari-hari untuk kulit normal",
      imagePath: "assets/images/Moizt.jpg",
    ),
    Product(
      name: "Dark Spot Corrector",
      description: "Krim untuk mengurangi flek hitam pada kulit",
      imagePath: "assets/images/dark.jpg",
    ),
    // Tambahkan produk lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rekomendasi Produk Skincare'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Sesuaikan jumlah produk per baris
          childAspectRatio: 4 / 5, // Sesuaikan aspek rasio produk
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) => _buildProductItem(_products[index]),
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 241, 44, 209),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Gambar produk
          Image.asset(
            product.imagePath,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imagePath;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}
