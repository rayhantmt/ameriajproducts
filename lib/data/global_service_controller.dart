import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalServiceController extends GetxController{
  @override
  void onInit() {
    readfromstorage();
    super.onInit();
  }

  var fullname = ''.obs;
  var uic = ''.obs;
 // var rank = ''.obs;


  void updaedinfo(
    String updatedname,
    String updteduic,
   // String updatedrank,
  ) {
    fullname.value = updatedname;
    uic.value = updteduic;
   // rank.value = updatedrank;
   
  }

  void readfromstorage() {
    final storage = GetStorage();
     fullname.value = storage.read('name');
     uic.value = storage.read('uic');
    //rank.value = storage.read('bio');
    
  }

  // void updatepforileurl(String url) {
  //   profileimage.value = url;
  // }

  // void updatecoverurl(String url) {
  //   coverimage.value = url;
  // }
} 