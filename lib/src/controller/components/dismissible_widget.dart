import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/constant/linker.dart';

class DismissibleWidget extends StatelessWidget {
  final VoidCallback addOnTap;
  final VoidCallback removeOnTap;
  final String image;
  final String name;
  final String price;
  final String quantity;
  final VoidCallback onDismissed;
  final Function(int) onQuantityChanged;
  final int itemCount; // Added itemCount as a parameter

  DismissibleWidget({
    super.key,
    required this.addOnTap,
    required this.removeOnTap,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onDismissed,
    required this.onQuantityChanged,
    required this.itemCount, // Pass itemCount from parent
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: ImageIcon(AssetImage(AppImages.delete), color: Colors.white),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image(image: AssetImage(image)),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: price,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  textColor: AppColors.greenColor,
                ),
                BlackNormalText(
                  text: name,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                BlackNormalText(
                  text: quantity,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: addOnTap,
                  icon: Icon(Icons.add),
                  color: AppColors.greenColor,
                ),
                BlackNormalText(
                  text: itemCount.toString(), // Use passed itemCount
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey,
                ),
                IconButton(
                  onPressed: removeOnTap,
                  icon: Icon(Icons.remove),
                  color: AppColors.greenColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import  'package:grocery_app/src/controller/constant/linker.dart';
//
//
// class DismissibleWidget extends StatelessWidget {
//
//   VoidCallback addOnTap;
//   VoidCallback removeOnTap;
//   String image;
//   String name;
//   String price;
//   String quantity;
//   final VoidCallback onDismissed;
//
//    DismissibleWidget({super.key,
//      required this.addOnTap,
//      required this.removeOnTap,
//      required this.image,
//      required this.name,
//      required this.price,
//      required this.quantity,
//      required this.onDismissed,
//    });
//
//   @override
//   Widget build(BuildContext context) {
//     return  Dismissible(
//         key: UniqueKey(),
//         direction: DismissDirection.endToStart,
//         background: Container(
//           color: Colors.red,
//           alignment: Alignment.centerRight,
//           padding: EdgeInsets.only(right: 20),
//           child: ImageIcon(AssetImage(AppImages.delete),color: Colors.white,),
//         ),
//         onDismissed: (direction) {
//           onDismissed();
//         },
//         child: Container(
//           width: double.infinity,
//           margin: const EdgeInsets.only(bottom: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Row(children: [
//             Container(
//               height: 100,
//               width: 100,
//               child: Image(image: AssetImage(image)),
//             ),
//             const SizedBox(width: 15),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BlackNormalText(
//                   text: price,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 12,
//                   textColor: AppColors.greenColor,
//                 ),
//                 BlackNormalText(
//                   text: name,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15,
//                 ),
//                 BlackNormalText(
//                   text: quantity,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12,
//                   textColor: Colors.grey,
//                 ),
//               ],
//             ),
//             Spacer(),
//             Column(children: [
//               IconButton(
//                 onPressed: addOnTap,
//                 icon: Icon(Icons.add),color: AppColors.greenColor,),
//               BlackNormalText(
//                 text: "5",
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 textColor: Colors.grey,
//               ),
//               IconButton(onPressed: removeOnTap, icon: Icon(Icons.remove),color: AppColors.greenColor,)
//             ],)
//           ],),
//         )
//     );
//   }
// }
