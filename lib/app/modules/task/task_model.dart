import 'package:ameriajproducts/app/utils/appimages.dart';

class TaskModel {
  final String name;
  final String img;
  TaskModel({required this.img, required this.name});
}

class TaskData {
  final List<TaskModel> taskdata = [
    TaskModel(img: Appimages.medpro, name: 'Medpro'),
    TaskModel(name: 'Weapon Qualification', img: Appimages.weapon),
    TaskModel(img: Appimages.range, name: 'Range Qualification'),
    TaskModel(name: 'Physical fitness', img: Appimages.fitness),
    TaskModel(name: 'Counseling', img: Appimages.counseling),
    TaskModel(name: 'Admin', img: Appimages.admin),
  ];
}
