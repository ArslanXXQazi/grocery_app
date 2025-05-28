// import  'package:grocery_app/src/controller/constant/linker.dart';
//
// class UserDataController extends GetxController
//
// {
//
//   var userId=''.obs;
//   var userName=''.obs;
//   var userEmail=''.obs;
//
//  void getUserId () async
//  {
//    try
//    {
//      userId.value = await FirebaseAuth.instance.currentUser!.uid;
//    }
//    catch(e)
//    {
//      print(e.toString());
//    }
//  }
//  void getUserData()async
//  {
//
//  }
//
// }


import 'package:grocery_app/src/controller/constant/linker.dart';

class UserDataController extends GetxController {
  var userId = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userImage = ''.obs;

  void getUserId() async {
    try {
      userId.value = await FirebaseAuth.instance.currentUser!.uid;
    } catch (e) {
      print(e.toString());
    }
  }

  void getUserData() async {
    try {
      // Firestore se userData collection query
      var userDoc = await FirebaseFirestore.instance
          .collection('userData')
          .where('userId', isEqualTo: userId.value)
          .get();

      // Agar document exists karta hai
      if (userDoc.docs.isNotEmpty) {
        var data = userDoc.docs.first.data();
        userName.value = data['userName'] ?? 'N/A'; // Name field se value
        userEmail.value = data['userEmail'] ?? 'N/A'; // Email field se value
        userImage.value=data['userImage']==""? 'rabdom image address' :data['userImage'] ;
      } else {
        print('User data not found in Firestore');
      }
    } catch (e) {
      print('Error fetching user data: ${e.toString()}');
    }
  }
}