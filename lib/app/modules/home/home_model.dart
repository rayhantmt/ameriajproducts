import 'package:ameriajproducts/app/modules/home/home_contorller.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:get/get.dart';

class HomeModel {
  final String name;
  final String img;
  final bool status;
  HomeModel({required this.img,required this.status, required this.name});
}

class HomeData {
  late final xyz=Get.find<HomeContorller>();
  late final List<HomeModel> homedata;
  
  HomeData() {
   var xyz = Get.find<HomeContorller>();
    homedata = [
      HomeModel(img: Appimages.medpro, name: 'Medpros',status: xyz.medprostatus.value ),
      HomeModel(name: 'Weapon Qualification', img: Appimages.weapon,status: xyz.weaponstatus.value),
      HomeModel(img: Appimages.range, name: "Range Qualification",status: xyz.rangestatus.value),
      HomeModel(name: 'Physical fitness', img: Appimages.fitness,status: xyz.physicalstatus.value),
      HomeModel(name: 'Counseling', img: Appimages.counseling,status: xyz.counselingstatus.value),
      HomeModel(name: 'Admin', img: Appimages.admin,status: xyz.adminstatus.value),
    ];
  }
}
