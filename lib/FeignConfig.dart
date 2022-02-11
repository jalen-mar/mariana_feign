import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mariana_feign/interceptor/LoggerInterceptor.dart';

class FeignConfig {
  static void init(Map data) {
    String schema = _getSchema(data["schema"]);
    String gateway = data["gateway"]??"";
    if (gateway.isNotEmpty) {
      gateway = "/$gateway";
    }
    GetIt.I.registerSingleton<Dio>(_getClient("$schema://${data["host"]}:${_getPort(schema, data["port"])}${_getGateway(data["gateway"])}", data["params"], data["headers"]));
  }

  static void setPreparedCallback(Function func) {
    GetIt.I.registerSingleton<Function>(func, instanceName: "preparedCallback");
  }

  static void setFinishCallback(Function func) {
    GetIt.I.registerSingleton<Function>(func, instanceName: "finishCallback");
  }

  static void setErrorCallback(Function func) {
    GetIt.I.registerSingleton<Function>(func, instanceName: "errorCallback");
  }

  static void setDataCallback(Function func) {
    GetIt.I.registerSingleton<Function>(func, instanceName: "dataCallback");
  }

  static void setHeader(String key, String value) {
    GetIt.I.get<Dio>().options.headers.addAll({key: value});
  }

  static String _getSchema(String? schema) {
    if (schema == null || schema.isEmpty) {
      schema = "http";
    }
    return schema;
  }

  static int _getPort(String schema, int? port) {
    if (port == null) {
      switch (schema) {
        case "http": {
          port = 80;
        }
        break;
        case "https": {
          port = 443;
        }
        break;
        default: {
          throw ArgumentError("Server'schema is Invalid!");
        }
      }
    }
    return port;
  }

  static String _getGateway(String gateway) {
    if (gateway.isNotEmpty) {
      gateway = "/$gateway";
    }
    return gateway;
  }

  static Dio _getClient(baseUrl, params, headers) {
    return Dio()..options = new BaseOptions(
        connectTimeout: params?["connectTimeout"]??3000,
        receiveTimeout: params?["receiveTimeout"]??3000,
        sendTimeout: params?["sendTimeout"]??3000,
        responseType: ResponseType.json,
        baseUrl: baseUrl,
        headers: Map.from(headers ?? {})
    )..interceptors.add(LoggerInterceptor(requestHeader: true, requestBody: true, responseBody: true, maxWidth: 999, error: true));
  }
}