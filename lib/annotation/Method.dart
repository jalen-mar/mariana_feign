import 'package:meta/meta.dart';

class HttpMethod {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PATCH = "PATCH";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";
  static const String HEAD = "HEAD";
  static const String OPTIONS = "OPTIONS";
}

@immutable
class Method {
  final String method;

  final String path;
  const Method(this.method, this.path);
}

@immutable
class GET extends Method {
  const GET(String path): super(HttpMethod.GET, path);
}

@immutable
class POST extends Method {
  const POST(String path): super(HttpMethod.POST, path);
}

@immutable
class PATCH extends Method {
  const PATCH(String path): super(HttpMethod.PATCH, path);
}

@immutable
class PUT extends Method {
  const PUT(String path): super(HttpMethod.PUT, path);
}

@immutable
class DELETE extends Method {
  const DELETE(String path): super(HttpMethod.DELETE, path);
}

@immutable
class HEAD extends Method {
  const HEAD(String path): super(HttpMethod.HEAD, path);
}

@immutable
class OPTIONS extends Method {
  const OPTIONS(String path): super(HttpMethod.OPTIONS, path);
}

@immutable
class Header {
  final String value;
  const Header(this.value);
}

@immutable
class Headers {
  final Map<String, dynamic>? value;
  const Headers([this.value]);
}

@immutable
class Body {
  const Body();
}

@immutable
class NoBody {
  const NoBody();
}

@immutable
class Cancel {
  const Cancel();
}

@immutable
class Callback {
  const Callback();
}

@immutable
class Field {
  final String? value;
  const Field([this.value]);
}

@immutable
class Path {
  final String? value;
  const Path([this.value]);
}

@immutable
class Query {
  final String value;
  final bool encoded;
  const Query(this.value, {this.encoded = false});
}

@immutable
class Queries {
  final bool encoded;
  const Queries({this.encoded = false});
}

abstract class _MimeType {
  abstract final String mime;
  const _MimeType();
}

@immutable
class FormUrlEncoded extends _MimeType {
  @override
  final mime = 'application/x-www-form-urlencoded';
  const FormUrlEncoded();
}

@immutable
class Part {
  final String? name;
  final String? contentType;
  const Part([this.name, this.contentType]);
}

@immutable
class MultiPart extends _MimeType {
  @override
  final mime = 'multipart/form-data';
  const MultiPart();
}

@immutable
class CacheControl {
  final int? maxAge;
  final int? maxStale;
  final int? minFresh;
  final bool noCache;
  final bool noStore;
  final bool noTransform;
  final bool onlyIfCached;
  final List<String> other;

  const CacheControl({
    this.maxAge,
    this.maxStale,
    this.minFresh,
    this.noCache = false,
    this.noStore = false,
    this.noTransform = false,
    this.onlyIfCached = false,
    this.other = const [],
  });
}