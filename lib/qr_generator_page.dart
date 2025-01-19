import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorPage extends StatelessWidget {
  const QRGeneratorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentId = "20250123"; // サンプル

    return Scaffold(
      appBar: AppBar(title: const Text('QRコード生成')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('学籍番号: $studentId'),
            const SizedBox(height: 20),
            // 最新版の qr_flutter では QrImageView が推奨
            QrImageView(
              data: studentId,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
