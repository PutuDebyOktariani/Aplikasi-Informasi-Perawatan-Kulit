import 'package:flutter/material.dart';

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Skincare'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          _buildNewsCard(
            title: 'Informasi Perawatan Kulit Berjerawat',
            imagePath: 'assets/images/Acne.jpg',
            color: Color.fromRGBO(239, 40, 176, 1), // Warna latar belakang card
            textColor: Colors.white, // Warna teks
            description: 'Kulit berjerawat cenderung memiliki kemerahan, benjolan, atau bintik-bintik. Perawatan yang tepat meliputi pembersihan rutin, penggunaan produk non-komedogenik, dan perawatan yang mengandung bahan anti-inflamasi.',
          ),
          SizedBox(height: 15.0),
          _buildNewsCard(
            title: 'Informasi Perawatan Kulit Normal',
            imagePath: 'assets/images/Normal.jpg',
            color: Colors.blueAccent, // Warna latar belakang card
            textColor: Colors.white, // Warna teks
            description: 'Kulit normal adalah jenis kulit yang sehat dan seimbang, tanpa masalah khusus seperti jerawat atau flek hitam. Perawatan kulit normal meliputi pembersihan rutin, pelembap, dan perlindungan matahari.',
          ),
          SizedBox(height: 15.0),
          _buildNewsCard(
            title: 'Informasi Perawatan Kulit Flek Hitam',
            imagePath: 'assets/images/Flekhitam.jpg',
            color: Colors.greenAccent, // Warna latar belakang card
            textColor: Colors.white, // Warna teks
            description: 'Kulit dengan flek hitam memiliki area kulit yang gelap atau bintik-bintik kecil. Perawatan yang tepat meliputi penggunaan produk pencerah kulit, perlindungan matahari, dan prosedur medis seperti peeling kimia atau laser.',
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard({
    required String title,
    required String imagePath,
    required Color color,
    required Color textColor,
    required String description,
  }) {
    return InkWell(
      onTap: () {
        // Tambahkan aksi yang ingin dilakukan saat card di-tap
      },
      child: Card(
        elevation: 4,
        color: color, // Set warna latar belakang card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Color.fromARGB(255, 218, 93, 243).withOpacity(0.7),
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor, // Set warna teks
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 60, // Set tinggi maksimal untuk deskripsi
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
