import 'package:flutter/material.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';


class DismissibleWidget extends StatefulWidget {

  VoidCallback addOnTap;
  VoidCallback removeOnTap;
  String image;
  String name;
  String price;
  String quantity;
  VoidCallback onDeleteTap;

   DismissibleWidget({super.key,
     required this.addOnTap,
     required this.removeOnTap,
     required this.image,
     required this.name,
     required this.price,
     required this.quantity,
     required this.onDeleteTap,
   });

  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  double _dragPosition = 0.0;
  double _maxSwipeDistance = 0.0;

  @override
  Widget build(BuildContext context) {
    _maxSwipeDistance = MediaQuery.of(context).size.width * 0.3; // Calculate 30% of screen width

    return Stack(
      children: [
        // Background with delete button (positioned to the right, full height, initially hidden)
        Positioned.fill(
          // Use a Container for the background which will be behind the swipable item
          child: Container(
            color: Colors.red,
            alignment: Alignment.centerRight, // Align delete icon to the right
            padding: EdgeInsets.only(right: 20), // Add some padding to the right of the icon
            child: GestureDetector(
              onTap: () {
                // Call the provided delete function
                widget.onDeleteTap();
                // Reset swipe position after delete
                setState(() {
                  _dragPosition = 0.0;
                });
              },
              // The tappable area for delete will be the right part of the background
              child: Container(
                 // Only make the area covering the icon tappable, or make the whole red area tappable
                 // For simplicity, let's make the area around the icon tappable.
                 // A more robust solution might involve calculating the icon's position.
                 // Or, as done now, wrap the red background in a GestureDetector.
                 width: _maxSwipeDistance, // Make the right part of the red area tappable
                 color: Colors.transparent, // Make the tappable area invisible
                 alignment: Alignment.center, // Align the child (Icon) within this tappable area
                 child: ImageIcon(
                   AssetImage(AppImages.delete),
                   color: Colors.white,
                 ),
               ),
            ),
          ),
        ),
        // Item content (initially at position 0, moves based on swipe)
        Transform.translate(
          offset: Offset(_dragPosition, 0), // Moves the item horizontally
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                // Update position based on drag, ensuring it stays within bounds
                _dragPosition += details.primaryDelta!;
                // Clamp the drag position between -_maxSwipeDistance (fully swiped left) and 0.0 (initial position)
                _dragPosition = _dragPosition.clamp(-_maxSwipeDistance, 0.0);
              });
            },
             onHorizontalDragEnd: (details) {
               // Optional: Add snapping logic here. If _dragPosition is > -_maxSwipeDistance/2, snap back to 0.
               // If _dragPosition is <= -_maxSwipeDistance/2, snap to -_maxSwipeDistance.
               if (_dragPosition.abs() > _maxSwipeDistance / 2) {
                 setState(() {
                   _dragPosition = -_maxSwipeDistance;
                 });
               } else {
                 setState(() {
                   _dragPosition = 0.0;
                 });
               }
             },
            child: Container(
              width: double.infinity,
             margin: const EdgeInsets.only(bottom: 10),
             decoration: BoxDecoration(
               color: Colors.white, // Item background color
               borderRadius: BorderRadius.circular(5),
             ),
              child: Row(children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage(widget.image)),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlackNormalText(
                      text: widget.price,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      textColor: AppColors.greenColor,
                    ),
                    BlackNormalText(
                      text: widget.name,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    BlackNormalText(
                      text: widget.quantity,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textColor: Colors.grey,
                    ),
                  ],
                ),
                Spacer(),
                Column(children: [
                  IconButton(
                    onPressed: widget.addOnTap,
                    icon: Icon(Icons.add),color: AppColors.greenColor,),
                  BlackNormalText(
                    text: "5", // This should probably come from a variable
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.grey,
                  ),
                  IconButton(onPressed: widget.removeOnTap, icon: Icon(Icons.remove),color: AppColors.greenColor,)
                ],)
              ],),
            )
          ),
        ),
      ],
    );
  }
}


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
//
//
//   DismissibleWidget({super.key,
//     required this.addOnTap,
//     required this.removeOnTap,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.quantity,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return  Dismissible(
//         key: Key("item_key"),
//         direction: DismissDirection.endToStart,
//         background: Container(
//           color: Colors.red,
//           alignment: Alignment.centerRight,
//           padding: EdgeInsets.only(right: 20),
//           child: ImageIcon(AssetImage(AppImages.delete),color: Colors.white,),
//         ),
//         onDismissed: (direction) {
//           print("Item deleted");
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
