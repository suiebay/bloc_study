import 'package:dio/dio.dart';

abstract class ProfileRemoteDatasource {
  Future<Response> getProfile();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  Dio dio = Dio();

  @override
  Future<Response> getProfile() async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users/3');
    return response;
  }

}