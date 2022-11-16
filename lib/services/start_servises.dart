import 'dart:convert';
import '../detels/WorldStatasModels.dart';
import './utilitis/app_uri.dart';
import 'package:http/http.dart'as http;

class StartServises {

 Future<WorldStatasModels> factWorldStatRecord() async{
   final respons= await http.get(Uri.parse(AppUrl.worldStatesApi));
   var data=jsonDecode(respons.body);
  if(respons.statusCode==200){
    return WorldStatasModels.fromJson(data);
  }
  else{
   throw Exception('Error');

  }
  }

 Future<List<dynamic>> countriesListApi() async{

   final respons= await http.get(Uri.parse(AppUrl.countrisList));
   var data=jsonDecode(respons.body);
   if(respons.statusCode==200){
     return data;
   }

   else{
     throw Exception('Error');

   }
 }


}


