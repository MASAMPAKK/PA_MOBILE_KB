import 'dart:typed_data';
import 'package:flutter/material.dart';

class ScanResultPage extends StatelessWidget {
  final Uint8List imageBytes;
  final String hasil;

  const ScanResultPage({
    Key? key,
    required this.imageBytes,
    required this.hasil,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Hasil Scan Pisang"),
        backgroundColor: Colors.black87,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // BOX HASIL
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black45),
              ),
              child: Center(
                child: Text(
                  hasil,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 20),

            // GAMBAR
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade300,
                child: Image.memory(imageBytes, fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 20),

            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: Icon(Icons.search, size: 32),
            ),
          ],
        ),
      ),
    );
  }
}
