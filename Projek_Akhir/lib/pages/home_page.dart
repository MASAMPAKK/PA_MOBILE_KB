import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  // CEK PERTAMA KALI APLIKASI DIBUKA
  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? first = prefs.getBool("first_launch");

    if (first == null || first == true) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _showTutorialPopup();
      });

      prefs.setBool("first_launch", false);
    }
  }

  // POPUP TUTORIAL
  void _showTutorialPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tutorial Aplikasi"),
          content: const Text("Ingin melihat tutorial penggunaan aplikasi?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tidak"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/tutorial");
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),

      // =======================
      //     APP BAR ATAS
      // =======================
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Klasifikasi Buah Pisang',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/tutorial'),
            child: const Text('Tutorial', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            child: const Text('About Us', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),

      // =======================
      //       BODY UTAMA
      // =======================
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  BananaCategoryBox(
                    title: 'Masak',
                    description: 'Warna kuning merata, siap dikonsumsi.',
                  ),
                  BananaCategoryBox(
                    title: 'Belum Masak',
                    description: 'Kulit masih hijau, tekstur keras.',
                  ),
                  BananaCategoryBox(
                    title: 'Kematangan',
                    description: 'Sangat matang dan lembek.',
                  ),
                  BananaCategoryBox(
                    title: 'Busuk',
                    description: 'Tidak layak konsumsi, kulit hitam.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),

      // =====================================
      //  TOMBOL SCAN DI TENGAH BAWAH
      // =====================================
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        child: const Icon(Icons.search, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(height: 50),
      ),
    );
  }
}

// =======================
//  WIDGET KOTAK GRID
// =======================
class BananaCategoryBox extends StatelessWidget {
  final String title;
  final String description;

  const BananaCategoryBox({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.image, size: 50, color: Colors.black54),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
