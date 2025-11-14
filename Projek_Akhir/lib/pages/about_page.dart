import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),

      appBar: AppBar(
        backgroundColor: const Color(0xFF9F5E33),
        centerTitle: true,

        //  Tombol Home icon
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, '/home');
          },
        ),

        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Anggota Kelompok',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // ========= 3 KOTAK MEMBER =========
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MemberCard(
                  name: 'Muhammad Aidil Saputra',
                  nim: '2309106042',
                ),
                MemberCard(
                  name: 'Muhammad Rafif Hanif',
                  nim: '2309106044',
                ),
                MemberCard(
                  name: 'Adhitya Fajar Al-Huda',
                  nim: '2309106027',
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              'Tentang Kami',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // ========= BOX PENJELASAN =========
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Aplikasi ini dibuat untuk mengklasifikasikan tingkat kematangan buah pisang '
                    'berdasarkan gambar yang diunggah atau dipindai menggunakan kamera. '
                    'Tujuan aplikasi ini adalah membantu petani, pedagang, dan konsumen '
                    'dalam menentukan kualitas dan kesiapan konsumsi buah pisang '
                    'secara cepat dan akurat menggunakan machine learning berbasis Flutter.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String nim;

  const MemberCard({super.key, required this.name, required this.nim});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            nim,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
