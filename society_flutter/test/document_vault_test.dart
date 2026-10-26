import 'package:flutter_test/flutter_test.dart';
import 'package:society_flutter/services/society_state.dart';

void main() {
  group('Document Vault and Storage Formatters', () {
    test('formatFileSize correctly formats bytes into readable units', () {
      expect(SocietyState.formatFileSize(512), equals('512 B'));
      expect(SocietyState.formatFileSize(1024), equals('1.0 KB'));
      expect(SocietyState.formatFileSize(1024 * 500), equals('500.0 KB'));
      expect(SocietyState.formatFileSize(1024 * 1024), equals('1.0 MB'));
      expect(SocietyState.formatFileSize((1024 * 1024 * 3.5).toInt()), equals('3.5 MB'));
      expect(SocietyState.formatFileSize(10 * 1024 * 1024), equals('10.0 MB'));
    });
  });
}
