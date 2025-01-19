import 'package:flutter/material.dart';
import 'print_page.dart';

class InputFormPage extends StatefulWidget {
  final String studentId;

  const InputFormPage({Key? key, required this.studentId}) : super(key: key);

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _reason;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('遅刻情報入力')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('学籍番号: ${widget.studentId}'),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: '遅刻理由'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '遅刻理由を入力してください';
                  }
                  return null;
                },
                onSaved: (value) => _reason = value,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickDate,
                child: Text(
                  _selectedDate == null
                      ? '日付を選択'
                      : '選択日: ${_selectedDate.toString().split(" ").first}',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text('印刷画面へ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // _reason に値が入る
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PrintPage(
            data: {
              'studentId': widget.studentId,
              'reason': _reason,
              'date': _selectedDate,
            },
          ),
        ),
      );
    }
  }
}
