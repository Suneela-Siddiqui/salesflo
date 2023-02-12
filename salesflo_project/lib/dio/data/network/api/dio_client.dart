import 'package:dio/dio.dart';
import 'package:salesflo_project/dio/data/network/constants/endpoints.dart';

class DioClient {
  // dio instance

  final Dio _dio;

  DioClient(this._dio) {
  _dio
    ..options.baseUrl = Endpoints.baseUrl
    ..options.connectTimeout = Endpoints.connectionTimeout
    ..options.receiveTimeout = Endpoints.receiveTimeout
    ..options.responseType = ResponseType.json;
  }

  // Get:-----------------------------------------------------------------------
  // About url: There is only one required parameter in Get Method URL
  // whenever we want to make a GET request we need to pass that path from which we want a response back
  
  // About Query Parameter: are a way to pass additional information to a widget through its constructor or through a named route
  //  {'name' : 'xyz'} --> not applicable in our case
  
  // About Options: describes the HTTP request information and configuration.
  // can paas basic configurations like Headers, Method Type, Content-Type, Type, Response etc

  // About Cancel Token: can cancel a request by using a cancel token. one token can be shared with different requests
  // when a token's cancel method is invoked, all requests with this token will be cancelled.

  // About onReceiveProgress: a callback which is used to listen the progress for sending/receiving data.
  // It has two parameters: COUNT and TOTAL
  // COUNT: indicates the length of the bytes that have been sent/received
  // TOTAL: indicates the length of the response/body.
  // --> not applicable in our case b/c we are doing a simple task

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // In our case, we are going to send a username anad a jot type when we are making a post request.
  // the param for all three methods (POST, PUT, DELETE) will remain same however the type of method will only change.

  // Post:----------------------------------------------------------------------
Future<Response> post(
  String url, {
  data,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  try {
    final Response response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  } catch (e) {
    rethrow;
  }
}

// Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}

