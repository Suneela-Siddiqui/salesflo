import 'package:dio/dio.dart';

// why we have used DioException and what is it actually?
// DioException is used for catching the error.
// a separate class is created that returns the human readable  and understandable error message. 
// it could be anything, a connection timeout message, cancel request error, or the error that hs been sent by the server too.
// this class becomes very handy when it comes to handling errors.

class DioExceptions implements Exception {
late String message;

DioExceptions.fromDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      message = "Request to API server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      message = "Connection timeout with API server";
      break;
    case DioErrorType.receiveTimeout:
      message = "Receive timeout in connection with API server";
      break;
    case DioErrorType.response:
      message = _handleError(
        dioError.response?.statusCode,
        dioError.response?.data,
      );
      break;
    case DioErrorType.sendTimeout:
      message = "Send timeout in connection with API server";
      break;
    case DioErrorType.other:
      if (dioError.message.contains("SocketException")) {
        message = 'No Internet';
        break;
      }
      message = "Unexpected error occurred";
      break;
    default:
      message = "Something went wrong";
      break;
  }
 // final errorMessage = DioExceptions.fromDioError(e).toString();

}

String _handleError(int? statusCode, dynamic error) {
  switch (statusCode) {
    case 400:
      return 'Bad request';
    case 401:
      return 'Unauthorized';
    case 403:
      return 'Forbidden';
    case 404:
      return error['message'];
    case 500:
      return 'Internal server error';
    case 502:
      return 'Bad gateway';
    default:
      return 'Oops something went wrong';
  }
}

@override
String toString() => message;

}
