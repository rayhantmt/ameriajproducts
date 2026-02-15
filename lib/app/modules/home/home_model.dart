import 'package:ameriajproducts/app/modules/home/home_contorller.dart';
import 'package:ameriajproducts/app/utils/appimages.dart';
import 'package:get/get.dart';

class HomeModel {
  final String name;
  final String img;
  final RxBool status;
  HomeModel({required this.img,required this.status, required this.name});
}

class HomeData {
  late final xyz=Get.find<HomeContorller>();
  late final List<HomeModel> homedata;
  
  HomeData() {
   var xyz = Get.find<HomeContorller>();
    homedata = [
      HomeModel(img: Appimages.medpro, name: 'Medpros',status: xyz.medprostatus ),
      HomeModel(name: 'Weapon Qualification', img: Appimages.weapon,status: xyz.weaponstatus),
      HomeModel(img: Appimages.range, name: "Range Qualification",status: xyz.rangestatus),
      HomeModel(name: 'Physical fitness', img: Appimages.fitness,status: xyz.physicalstatus),
      HomeModel(name: 'Counseling', img: Appimages.counseling,status: xyz.counselingstatus),
      HomeModel(name: 'Admin', img: Appimages.admin,status: xyz.adminstatus),
    ];
  }
}
