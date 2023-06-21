part of 'util.dart';
dynamic convertToJson(dynamic o){
  try{
    o = o.toJson();
    return o;
  }catch(e){
    return o;
  }
}
