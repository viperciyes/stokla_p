import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stokla_flutter/src/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
