// as userApi class only returns the RAW data. 
// that RAW data is converted to the UserModel/NewUser model inside repo class.
// the reason for separating this logic is for better code readability and testing purpose.
// another major reason for separation is in this class you can manipulate the data that you are passing to the server.
// and also, you can manipulate the dtaa the server is giving to you.
// you can perform validations, handle error, etc in this class

import 'package:dio/dio.dart';
import 'package:salesflo_project/dio/data/models/new_user.dart';
import 'package:salesflo_project/dio/data/models/user_model.dart';
import 'package:salesflo_project/dio/data/network/api/user/user_api.dart';
import 'package:salesflo_project/dio/data/network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsersApi();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> addNewUserRequested(String name, String job) async {
    try {
      final response = await userApi.addUserApi(name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> updateUserRequested(int id, String name, String job) async {
    try {
      final response = await userApi.updateUserApi(id, name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
