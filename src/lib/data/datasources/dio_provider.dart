import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio(BaseOptions(
      baseUrl: 'https://myktp-backend-f9626b022d13.herokuapp.com',
    ));
