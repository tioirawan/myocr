import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio(
      BaseOptions(
        baseUrl: 'https://myktp-backend-f9626b022d13.herokuapp.com',
        // baseUrl:
        //     'https://a6a5-2400-9800-763-9ab9-9f5-959f-2825-f07c.ngrok-free.app/',
      ),
    );
