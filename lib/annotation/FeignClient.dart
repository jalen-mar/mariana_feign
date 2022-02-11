import 'package:meta/meta.dart';

enum Parser {
  JsonSerializable,

  MapSerializable,

  DartJsonMapper
}

@immutable
class FeignClient {
  final String? baseUrl;

  final Parser? parser;

  const FeignClient({this.baseUrl, this.parser});
}