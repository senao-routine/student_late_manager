import 'package:flutter/material.dart';
import 'qr_scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRコードアプリ',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QRScanPage(),
    );
  }
}
