
import 'package:api_test1/controller/data/remote/end_point.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper{

  static Dio dio=Dio();

   static init(){
     dio=Dio(
      BaseOptions(
        baseUrl: baseUrl,
       receiveDataWhenStatusError: true,
        headers: {
          "Content-type":"application/json",
          "Accept":"application/json"
        }
      )
    );
  }


  Future<Response> getData({
    required String endPoint,
    Map<String,dynamic>? query,
    String? token,
  })async{
     try{
     dio.options.headers={
       "Authorization":"Bearer ${token ?? "" }",
     };
     Response response=await dio.get(endPoint,queryParameters: query);
     return response;
     }
     catch(e){
       rethrow;
     }
  }


 Future<void> postData({
    required String endPoint,
    Map<String,dynamic>? data,
    Map<String,dynamic>? query,
    String? token,
})async{
     try{
     dio.options.headers={
       "Authorization":"Bearer ${token ?? ""}"
     };
    Response response=await dio.post(endPoint,data: data,queryParameters: query);
    if (kDebugMode) {
      print(response);
    }
     }
     catch(e){
       if (kDebugMode) {
         print(e);
       }
     }
  }


  Future<Response>putData({
    required String endPoint,
    String? token,
    Map<String,dynamic>? query,
    Map<String,dynamic>? data,
})async{
     try{
     dio.options.headers={
       "Authorization":"Bearer ${token ?? ""}"
     };
     Response response=await dio.put(endPoint,queryParameters: query,data: data);
     return response;
     }
     catch(e){
       rethrow;
     }
  }

  Future<Response>deleteData({
    required String endPoint,
    String? token,
    Map<String,dynamic>? query,
    Map<String,dynamic>? data,
})async{
     try{
     dio.options.headers={
       "Authorization":"Bearer ${token ?? ""}"
     };
    Response response=await dio.delete(endPoint,queryParameters: query,data: data);
    return response;
     }
     catch(e){
       rethrow;
     }
  }

}