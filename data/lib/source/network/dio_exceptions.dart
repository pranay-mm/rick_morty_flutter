import 'package:dio/dio.dart';

import '../../generated/l10n.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = S.current.errorDioCancel;
        break;
      case DioExceptionType.connectionTimeout:
        message = S.current.errorConnectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = S.current.errorReceiveTimeout;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioExceptionType.sendTimeout:
        message = S.current.errorSendTimeout;
        break;
      case DioExceptionType.unknown:
        if (dioError.message?.contains("SocketException") == true) {
          message = S.current.noInternet;
          break;
        } else if (dioError.message?.contains('HandshakeException') == true) {
          message = S.current.responseDataNot;
          break;
        }
        message = S.current.unexpectedErrorOccurred;
        break;
      default:
        message = S.current.something_went_wrong;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['error'] ?? S.current.bad_request;
      case 401:
        return error['error'] ?? S.current.unauthorized;
      case 403:
        return error['error'] ?? S.current.forbidden;
      case 404:
        return error['error'] ?? S.current.error;
      case 420:
        return S.current.sessionExpired;
      case 500:
        return error['error'] ?? S.current.internalServerError;
      case 502:
        return error['error'] ?? S.current.serverUnavailable;
      default:
        return S.current.oopsSomethingWentWrong;
    }
  }

  @override
  String toString() => message;
}
