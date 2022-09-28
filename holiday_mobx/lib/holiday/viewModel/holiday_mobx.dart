

import 'package:holiday_mobx/holiday/model/holiday_model.dart';
import 'package:holiday_mobx/holiday/service/holiday_manager.dart';
import 'package:mobx/mobx.dart';
part 'holiday_mobx.g.dart';

class HolidaysViewModel = _HolidaysViewModelBase with _$HolidaysViewModel;

abstract class _HolidaysViewModelBase with Store {

   final HolidayService service = HolidayService();
   
  List<HolidayModel>? holItems = [];

  @observable
  bool isLoading = false;

  @action
  void changeLoading (){
    isLoading = !isLoading;
  }

  @action
  Future<void> fetch () async {
    changeLoading();
    holItems = await service.getHolidays()  ?? [];
    changeLoading(); 
  }

}