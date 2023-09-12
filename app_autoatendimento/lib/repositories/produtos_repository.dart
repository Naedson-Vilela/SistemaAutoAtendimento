import 'package:dio/dio.dart';

class ProdutosRepository {
  // ignore: non_constant_identifier_names
  Future<List<dynamic>> get_Produtos() async {
    final dio = Dio();
    final response =
        await dio.get('http://192.168.18.51:8000/api/v1/produtos/');

    if (response.statusCode == 200) {
      final List<dynamic> data = List<Map<String, dynamic>>.from(response.data)
          .map((dynamic item) => item as Map<String, dynamic>)
          .toList();
      return data;
    } else {
      throw Exception('Falha ao carregar os produtos.');
    }
  }
}
