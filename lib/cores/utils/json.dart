part of 'util.dart';

dynamic convertToJson(dynamic o) {
  try {
    if (o is List) {
      o = [...o.map((e) => e.toJson()).toList()];
    } else {
      o = o.toJson();
    }
    return o;
  } catch (e) {
    return o;
  }
}
