
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:holiday_mobx/holiday/viewModel/holiday_mobx.dart';
import 'package:holiday_mobx/screens/splash.dart';


class HolidaysView extends StatefulWidget {
  const HolidaysView({Key? key}) : super(key: key);

  @override
  State<HolidaysView> createState() => _HolidaysViewState();
}

class _HolidaysViewState extends State<HolidaysView> {

  late final HolidaysViewModel holidaysViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidaysViewModel = HolidaysViewModel();
    holidaysViewModel.fetch();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return holidaysViewModel.isLoading ? Splash() : Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 300,
        child:ListView.builder(
          itemCount: holidaysViewModel.holItems?.length ?? 0,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Text("${holidaysViewModel.holItems?[index].name}"),
            ),
          );
        },)   
      ),
    );
    },);
  }
}