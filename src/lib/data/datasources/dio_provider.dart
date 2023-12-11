import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio(BaseOptions(
      baseUrl: 'http://10.0.2.2:5000',
    ));
