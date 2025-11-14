import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // kuning muda
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Tutorial Penggunaan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              'Cara Menggunakan Aplikasi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 35),

            // LANGKAH 1
            const SizedBox(
              width: double.infinity,
              child: TutorialStep(
                step: "1",
                title: "Buka Halaman Scan",
                description:
                "Ketuk ikon kaca pembesar (search) di bagian bawah halaman Home untuk masuk ke halaman scan klasifikasi.",
              ),
            ),

            const SizedBox(height: 20),

            // LANGKAH 2
            const SizedBox(
              width: double.infinity,
              child: TutorialStep(
                step: "2",
                title: "Pilih Metode Input",
                description:
                "Anda dapat memindai buah pisang langsung dengan kamera atau mengunggah gambar dari galeri.",
              ),
            ),

            const SizedBox(height: 20),

            // LANGKAH 3
            const SizedBox(
              width: double.infinity,
              child: TutorialStep(
                step: "3",
                title: "Tunggu Proses Klasifikasi",
                description:
                "Aplikasi akan memproses gambar menggunakan model machine learning untuk menentukan tingkat kematangan buah pisang.",
              ),
            ),

            const SizedBox(height: 20),

            // LANGKAH 4
            const SizedBox(
              width: double.infinity,
              child: TutorialStep(
                step: "4",
                title: "Lihat Hasil",
                description:
                "Hasil klasifikasi seperti 'Masak', 'Belum Masak', 'Kematangan', atau 'Busuk' akan ditampilkan.",
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Selamat mencoba!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class TutorialStep extends StatelessWidget {
  final String step;
  final String title;
  final String description;

  const TutorialStep({
    super.key,
    required this.step,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Langkah $step",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
