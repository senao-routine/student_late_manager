import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrintPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const PrintPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('印刷プレビュー')),
      body: Center(
        child: ElevatedButton(
          onPressed: _printDocument,
          child: const Text('印刷を開始'),
        ),
      ),
    );
  }

  Future<void> _printDocument() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('学籍番号: ${data['studentId']}'),
              pw.Text(
                  '遅刻日: ${data['date']?.toString().split(" ").first ?? "未選択"}'),
              pw.Text('理由: ${data['reason'] ?? "未入力"}'),
            ],
          );
        },
      ),
    );

    // PDFをプレビューや印刷のUIに流し込む
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
