import 'dart:typed_data';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'scan_result_page.dart';

class ScanPage extends StatefulWidget {
  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Uint8List? imageBytes;

  // ======================
  // Upload File (Flutter Web)
  // ======================
  Future<void> uploadImage() async {
    final uploadInput = html.FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = html.FileReader();

      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((event) {
        setState(() {
          imageBytes = reader.result as Uint8List;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ScanResultPage(
              imageBytes: imageBytes!,
              hasil: "Kematangan: Matang",
            ),
          ),
        );
      });
    });
  }

  // Kamera (akan sama seperti upload)
  Future<void> scanCamera() async {
    return uploadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Scan Pisang"),
        backgroundColor: Colors.black87,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // UPLOAD AREA
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: Colors.white,
              ),
              child: Center(
                child: TextButton(
                  onPressed: uploadImage,
                  child: Text(
                    "Upload File Gambar Pisang",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // SCAN GAMBAR
            Expanded(
              child: GestureDetector(
                onTap: scanCamera,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: Center(
                    child: Text(
                      "Scan Gambar",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
