import 'package:dio/dio.dart';
import 'package:test_bloc/logic/profile/data/datasources/profile_datasource.dart';
import 'package:test_bloc/logic/profile/data/models/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepositoryImpl(this.profileRemoteDatasource);

  @override
  Future<Profile> getProfile() async {
    Response response = await profileRemoteDatasource.getProfile();
    return Profile.fromJson(response.data);
  }

}