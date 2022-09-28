

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:holiday_mobx/holiday/model/holiday_model.dart';



class HolidayService {

  final Dio dio = Dio(BaseOptions(baseUrl: "https://date.nager.at/api/"));


  Future<List<HolidayModel>?> getHolidays () async {

    final response = await dio.get("v2/publicholidays/2020/US");

    if(response.statusCode == HttpStatus.ok){
      final holDatas = response.data;

      if(holDatas is List){
        return holDatas.map((e) => HolidayModel.fromJson(e)).toList();
      }
    }else{
      return [];
    }

  }

}