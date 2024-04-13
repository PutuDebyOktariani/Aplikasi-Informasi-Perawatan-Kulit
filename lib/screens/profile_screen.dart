import 'package:flutter/material.dart';
//import 'package:my_app/screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/Deby.jpg'),
            ),
            SizedBox(height: 20),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('putudebyoktariani@gmail.com'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Nomor Telepon'),
              subtitle: const Text('0881037794604'),
            ),

            // Tambahkan konten di bawah email dan nomor telepon
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Alamat'),
              subtitle: const Text('Banyuning Timur'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.cake),
              title: const Text('Tanggal Lahir'),
              subtitle: const Text('09 Oktober 2003'),
            ),
          ],
        ),
      ),
    );
  }
}
