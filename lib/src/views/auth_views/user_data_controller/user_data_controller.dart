
import 'package:grocery_app/src/controller/constant/linker.dart';

class UserDataController extends GetxController {
  var userId = ''.obs;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userImage = ''.obs;
  var userAge = ''.obs;
  var userPhone = ''.obs;
  var userBankAccount = ''.obs;
  var userAccountName = ''.obs;
  var userGender = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Controller initialize hotay hi user ID fetch karen
    getUserId();
  }

  void getUserId() async {
    try {
      // Currently logged-in user ki ID hasil karen
      String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

      if (currentUserId != null) {
        print('------function for fetching user id:${currentUserId}');
        // Agar user logged in hai, toh ID set karen
        userId.value = currentUserId;
        print('--------------2function for fetching userId.value=${userId.value}');
        getUserData();
      }

    }
    catch (e)
    {
      print('Error getting user ID: ${e.toString()}');
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
        userAge.value=data['userAge']??"N/A";
        userPhone.value=data['userPhone']??"N/A";
        userBankAccount.value=data['userBankAccount']??"N/A";
        userAccountName.value=data['userAccountName']??"N/A";
        userGender.value=data['userGender']??"N/A";
        print('-------------------get user data functiion------------');
      } else {
        print('User data not found in Firestore');
      }
    } catch (e) {
      print('Error fetching user data: ${e.toString()}');
    }
  }
}



// import 'package:grocery_app/src/controller/constant/linker.dart';
//
// class UserDataController extends GetxController {
//   var userId = ''.obs;
//   var userName = ''.obs;
//   var userEmail = ''.obs;
//   var userImage = ''.obs;
//   var userAge = ''.obs;
//   var userPhone = ''.obs;
//   var userBankAccount = ''.obs;
//   var userAccountName = ''.obs;
//   var userGender = ''.obs;
//
//   void getUserId() async {
//     try {
//       userId.value = await FirebaseAuth.instance.currentUser!.uid;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   void getUserData() async {
//     try {
//       var userDoc = await FirebaseFirestore.instance
//           .collection('userData')
//           .where('userId', isEqualTo: userId.value)
//           .get();
//
//       // Agar document exists karta hai
//       if (userDoc.docs.isNotEmpty) {
//         var data = userDoc.docs.first.data();
//         userName.value = data['userName'] ?? 'N/A'; // Name field se value
//         userEmail.value = data['userEmail'] ?? 'N/A'; // Email field se value
//         userImage.value=data['userImage']==""? 'rabdom image address' :data['userImage'] ;
//         userAge.value=data['userAge']??"N/A";
//         userPhone.value=data['userPhone']??"N/A";
//         userBankAccount.value=data['userBankAccount']??"N/A";
//         userAccountName.value=data['userAccountName']??"N/A";
//         userGender.value=data['userGender']??"N/A";
//         print('-------------------get user data functiion------------');
//       } else {
//         print('User data not found in Firestore');
//       }
//     } catch (e) {
//       print('Error fetching user data: ${e.toString()}');
//     }
//   }
// }