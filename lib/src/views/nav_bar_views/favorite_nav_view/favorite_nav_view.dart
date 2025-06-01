import 'package:grocery_app/src/controller/components/dismissible_widget.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';

// Convert to StatefulWidget to manage the list of cart items
class FavoriteNavView extends StatefulWidget {
  const FavoriteNavView({super.key});

  @override
  _FavoriteNavViewState createState() => _FavoriteNavViewState();
}

class _FavoriteNavViewState extends State<FavoriteNavView> {
  // Sample list of cart items
  // In a real app, this data would come from a state management solution or API
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Fresh Broccoli',
      'price': '\$2.25',
      'quantity': '150 gm',
      'image': AppImages.pineapple, // Corrected image key to pineapple to avoid undefined error
    },
    {
      'name': 'Black Grapes',
      'price': '\$3.22',
      'quantity': '1 KG',
      'image': AppImages.pineapple, // Using pineapple as a placeholder, replace with actual grape image if available
    },
    {
      'name': 'Pine Apple',
      'price': '\$43',
      'quantity': '50 KG',
      'image': AppImages.pineapple,
    },
    {
      'name': 'Pine Apple',
      'price': '\$43',
      'quantity': '50 KG',
      'image': AppImages.pineapple,
    },
  ];

  void _deleteItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
      // After deleting, if the list becomes empty, you might want to show a message
      // or navigate away. Add that logic here if needed.
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
            text: "Favorites",
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
      body: Padding(
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
              addOnTap: () {},
              removeOnTap: () {},
              // Implement the delete logic here
              onDismissed: () {
                _deleteItem(index);
              },
            );
          },
        ),
      ),
    );
  }
}
