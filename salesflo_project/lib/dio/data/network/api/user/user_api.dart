// define different api request methods which will directly call the client's method and will return the RAW data.
// Methods defined in this class will return the RAW data not the model that we created earlier.


// we are simply calling different methods of the DioClient by passing the required path/endpoint.
//as also we have already defined the base URL in the DioClient, we only need to pass the rest of the Endpoint and not the full URL
// for the POST method the required data is passed in MAP format
// for the PUT method we need an ID, which is used to update only the user that contains that ID
// for DELETE we only need the ID of the user that we want to delete.

import 'package:dio/dio.dart';
import 'package:salesflo_project/dio/data/network/api/dio_client.dart';
import 'package:salesflo_project/dio/data/network/constants/endpoints.dart';

class UserApi {
final DioClient dioClient;

UserApi({required this.dioClient});

Future<Response> addUserApi(String name, String job) async {
  try {
    final Response response = await dioClient.post(
      Endpoints.users,
      data: {
        'name': name,
        'job': job,
      },
    );
    return response;
  } catch (e) {
    rethrow;
  }
}

Future<Response> getUsersApi() async {
  try {
    final Response response = await dioClient.get(Endpoints.users);
    return response;
  } catch (e) {
    rethrow;
  }
}

Future<Response> updateUserApi(int id, String name, String job) async {
  try {
    final Response response = await dioClient.put(
      Endpoints.users + '/$id',
      data: {
        'name': name,
        'job': job,
      },
    );
    return response;
  } catch (e) {
    rethrow;
  }
}

Future<void> deleteUserApi(int id) async {
  try {
    await dioClient.delete(Endpoints.users + '/$id');
  } catch (e) {
    rethrow;
  }
}
}
