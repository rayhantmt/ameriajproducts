import 'package:ameriajproducts/app/utils/appimages.dart';

class HomeModel {
  final String name;
  final String img;
  HomeModel({required this.img, required this.name});
}

class HomeData {
  final List<HomeModel> homedata = [
    HomeModel(img: Appimages.medpro, name: 'Medpro'),
    HomeModel(name: 'Weapon Qualification', img: Appimages.weapon),
    HomeModel(name: 'Physical fitness', img: Appimages.fitness),
    HomeModel(name: 'Counseling', img: Appimages.counseling),
    HomeModel(name: 'Admin', img: Appimages.admin),
  ];
}
