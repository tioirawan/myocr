import 'package:dio/dio.dart';

import '../../domain/models/dss_result_model.dart';
import '../../domain/models/identity_card_model.dart';
import '../../domain/repositories/dss_repository.dart';

class DssRepositoryImpl implements DssRepository {
  final Dio _dio;

  DssRepositoryImpl(this._dio);

  @override
  Future<List<DssResultModel>> calculateFuzzy(
      List<IdentityCardModel> cardList) async {
    // Data yang dikirim ke API fuzzy
    // [
    // {
    // "id": 0,
    // "name": "string",
    // "age": 0,
    // "location": 0,
    // "experience": 0,
    // "skill": 0,
    // "ipk": 0,
    // "org_exp": 0
    // }
    // ]
    final List<Map<String, dynamic>> cvDataJsonList = cardList
        .where((card) => card.cvData != null)
        .map((card) => {
              'id': card.id,
              'name': card.name,
              'age': card.cvData!.age,
              'location': card.cvData!.location,
              'experience': card.cvData!.workExperience,
              'skill': card.cvData!.skills,
              'ipk': card.cvData!.gpa,
              'org_exp': card.cvData!.organization,
            })
        .toList();

    final response = await _dio.get(
      '/fuzzy',
      data: cvDataJsonList,
    );

    final List<dynamic> data = response.data['data'];

    return data
        .map((e) => DssResultModel(
              id: e['id'],
              name: e['name'],
              score: e['score'],
            ))
        .toList();
  }
}
