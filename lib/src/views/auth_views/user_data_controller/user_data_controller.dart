import  'package:grocery_app/src/controller/constant/linker.dart';

class UserDataController extends GetxController

{

  var userId=''.obs;

 void getUserId () async
 {
   try
   {
     userId.value = await FirebaseAuth.instance.currentUser!.uid;
   }
   catch(e)
   {
     print(e.toString());
   }
 }

}
