// database.dart
// 簡易的に生徒番号 → 生徒氏名 を管理するサンプルデータ

final Map<String, String> studentDatabase = {
  '0001': '山田 太郎',
  '0002': '佐藤 花子',
  '20250123': '鈴木 次郎',
  // ... 追加
};

// 生徒番号をもとに氏名を取得する簡易関数
String? getStudentName(String studentId) {
  // studentIdはQRコードから取得した生徒番号を想定
  return studentDatabase[studentId];
}
