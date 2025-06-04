import 'package:grocery_app/src/controller/components/dismissible_widget.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';

// Convert to StatefulWidget to manage the list of cart items
class CartNavView extends StatefulWidget {
  const CartNavView({super.key});

  @override
  _CartNavViewState createState() => _CartNavViewState();
}

class _CartNavViewState extends State<CartNavView> {
  // Sample list of cart items
  // In a real app, this data would come from a state management solution or API
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Fresh Broccoli',
      'price': '\$2.25',
      'quantity': '150 gm',
      'image': AppImages.pineapple,
      'itemCount':1,
    },
    {
      'name': 'Black Grapes',
      'price': '\$3.22',
      'quantity': '1 KG',
      'image': AppImages.grapes,
      'itemCount':1,
    },
    {
      'name': 'Pine Apple',
      'price': '\$43',
      'quantity': '50 KG',
      'image': AppImages.avacoda,
      'itemCount':1,
    },
    {
      'name': 'Pine Apple',
      'price': '\$43',
      'quantity': '50 KG',
      'image': AppImages.peach,
      'itemCount':1,
    },
    {
      'name': 'Pine Apple',
      'price': '\$43',
      'quantity': '50 KG',
      'image': AppImages.vegetables,
      'itemCount':1,
    },
    {
      'name': 'Pine Apple',
      'price': '\$43',
      'quantity': '50 KG',
      'image': AppImages.pineapple,
      'itemCount':1,
    },
  ];

  void _deleteItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
      // After deleting, if the list becomes empty, you might want to show a message
      // or navigate away. Add that logic here if needed.
    });
  }
  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      _cartItems[index]['itemCount'] = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlackNormalText(
            text: "Shopping Cart",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: ImageIcon(AssetImage(AppImages.gear),color: Colors.black,))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              // Use ListView.builder directly inside Padding
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final item = _cartItems[index];
                  return DismissibleWidget(
                    // Provide a unique key for each item for correct list updates
                    key: UniqueKey(), // Added UniqueKey for DismissibleWidget
                    // Pass item data to the widget
                    image: item['image']!,
                    name: item['name']!,
                    price: item['price']!,
                    quantity: item['quantity']!,
                    // Add and remove onTap handlers (you can implement their logic later)
                    addOnTap: () {
                      _updateQuantity(index, (item['itemCount'] as int) + 1);
                    },
                    removeOnTap: () {
                      if ((item['itemCount'] as int) > 1) {
                        _updateQuantity(index, (item['itemCount'] as int) - 1);
                      }
                    },
                    itemCount: item['itemCount'] as int,
                    // Implement the delete logic here
                    onDismissed: () {
                      _deleteItem(index);
                    },
                    onQuantityChanged: (newQuantity){
                      _updateQuantity(index, newQuantity);
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
              flex: 30,
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlackNormalText(
                          text: "Subtotal",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        ),
                        BlackNormalText(
                          text: "\$56.7",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        )
                      ],),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlackNormalText(
                          text: "Shipping charges",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        ),
                        BlackNormalText(
                          text: "\$1.6",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        )
                      ],),
                    const SizedBox(height: 10),
                    Divider(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlackNormalText(
                          text: "Total",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        BlackNormalText(
                          text: "\$23",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )
                      ],),
                    const SizedBox(height: 10),
                    GreenButton(
                        onTap: (){},
                        text: "Checkout")
                  ],),
                ),
              ))
        ],
      ),
    );
  }
}












// import 'package:grocery_app/src/controller/components/dismissible_widget.dart';
// import  'package:grocery_app/src/controller/constant/linker.dart';
//
// // Convert to StatefulWidget to manage the list of cart items
// class CartNavView extends StatefulWidget {
//   const CartNavView({super.key});
//
//   @override
//   _CartNavViewState createState() => _CartNavViewState();
// }
//
// class _CartNavViewState extends State<CartNavView> {
//   // Sample list of cart items
//   // In a real app, this data would come from a state management solution or API
//   final List<Map<String, dynamic>> _cartItems = [
//     {
//       'name': 'Fresh Broccoli',
//       'price': '\$2.25',
//       'quantity': '150 gm',
//       'image': AppImages.pineapple, // Corrected image key to pineapple to avoid undefined error
//     },
//     {
//       'name': 'Black Grapes',
//       'price': '\$3.22',
//       'quantity': '1 KG',
//       'image': AppImages.grapes, // Using pineapple as a placeholder, replace with actual grape image if available
//     },
//     {
//       'name': 'Pine Apple',
//       'price': '\$43',
//       'quantity': '50 KG',
//       'image': AppImages.avacoda,
//     },
//     {
//       'name': 'Pine Apple',
//       'price': '\$43',
//       'quantity': '50 KG',
//       'image': AppImages.peach,
//     },
//     {
//       'name': 'Pine Apple',
//       'price': '\$43',
//       'quantity': '50 KG',
//       'image': AppImages.vegetables,
//     },
//     {
//       'name': 'Pine Apple',
//       'price': '\$43',
//       'quantity': '50 KG',
//       'image': AppImages.pineapple,
//     },
//   ];
//
//   void _deleteItem(int index) {
//     setState(() {
//       _cartItems.removeAt(index);
//       // After deleting, if the list becomes empty, you might want to show a message
//       // or navigate away. Add that logic here if needed.
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.greyColor,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           centerTitle: true,
//           title: BlackNormalText(
//             text: "Shopping Cart",
//             fontWeight: FontWeight.w500,
//             fontSize: 18,
//           ),
//           actions: [
//             IconButton(
//                 onPressed: (){},
//                 icon: ImageIcon(AssetImage(AppImages.gear),color: Colors.black,))
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 70,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//               // Use ListView.builder directly inside Padding
//               child: ListView.builder(
//                 itemCount: _cartItems.length,
//                 itemBuilder: (context, index) {
//                   final item = _cartItems[index];
//                   return DismissibleWidget(
//                     // Provide a unique key for each item for correct list updates
//                     key: UniqueKey(), // Added UniqueKey for DismissibleWidget
//                     // Pass item data to the widget
//                     image: item['image']!,
//                     name: item['name']!,
//                     price: item['price']!,
//                     quantity: item['quantity']!,
//                     // Add and remove onTap handlers (you can implement their logic later)
//                     addOnTap: () {},
//                     removeOnTap: () {},
//                     // Implement the delete logic here
//                     onDismissed: () {
//                       _deleteItem(index);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 30,
//               child: Container(
//                 padding: const EdgeInsets.all(15),
//             color: Colors.white,
//             child: SingleChildScrollView(
//               child: Column(children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                   BlackNormalText(
//                     text: "Subtotal",
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     textColor: Colors.grey,
//                   ),
//                     BlackNormalText(
//                       text: "\$56.7",
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       textColor: Colors.grey,
//                     )
//                 ],),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                   BlackNormalText(
//                     text: "Shipping charges",
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     textColor: Colors.grey,
//                   ),
//                     BlackNormalText(
//                       text: "\$1.6",
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       textColor: Colors.grey,
//                     )
//                 ],),
//                 const SizedBox(height: 10),
//                 Divider(),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     BlackNormalText(
//                       text: "Total",
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     BlackNormalText(
//                       text: "\$23",
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     )
//                   ],),
//                 const SizedBox(height: 10),
//                 GreenButton(
//                     onTap: (){},
//                     text: "Checkout")
//               ],),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
