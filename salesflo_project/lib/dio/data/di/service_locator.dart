import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salesflo_project/dio/data/network/api/dio_client.dart';
import 'package:salesflo_project/dio/data/network/api/user/user_api.dart';
import 'package:salesflo_project/dio/data/repository/repository.dart';
import 'package:salesflo_project/ui/list_users.dart';

final getIt = GetIt.instance;


Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));

  getIt.registerSingleton(HomeController());
}