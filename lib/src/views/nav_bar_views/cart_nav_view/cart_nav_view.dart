import 'package:flutter/material.dart';
import 'package:grocery_app/src/controller/components/dismissible_widget.dart';
import 'package:grocery_app/src/controller/constant/linker.dart';

class CartNavView extends StatefulWidget {
  const CartNavView({super.key});

  @override
  _CartNavViewState createState() => _CartNavViewState();
}

class _CartNavViewState extends State<CartNavView> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Fresh Broccoli',
      'price': 2.25,
      'quantity': '150 gm',
      'image': AppImages.pineapple,
      'itemCount': 1,
    },
    {
      'name': 'Black Grapes',
      'price': 3.22,
      'quantity': '1 KG',
      'image': AppImages.grapes,
      'itemCount': 1,
    },
    {
      'name': 'Pine Apple',
      'price': 43.0,
      'quantity': '50 KG',
      'image': AppImages.avacoda,
      'itemCount': 1,
    },
    {
      'name': 'Fresh Broccoli',
      'price': 2.25,
      'quantity': '150 gm',
      'image': AppImages.pineapple,
      'itemCount': 1,
    },
    {
      'name': 'Black Grapes',
      'price': 3.22,
      'quantity': '1 KG',
      'image': AppImages.grapes,
      'itemCount': 1,
    },
  ];

  // Calculate subtotal
  double get _subtotal {
    return _cartItems.fold(
      0.0,
          (sum, item) => sum + (item['price'] as double) * (item['itemCount'] as int),
    );
  }

  // Shipping charges (only applied if cart is not empty)
  double get _shippingCharges => _cartItems.isNotEmpty ? 1.6 : 0.0;

  // Calculate total
  double get _total => _subtotal + _shippingCharges;

  void _deleteItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: BlackNormalText(
            text: "Shopping Cart",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage(AppImages.gear), color: Colors.black),
            ),
          ],
        ),
      ),
      body: _cartItems.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppImages.bag)),
            const SizedBox(height: 20),
            BlackNormalText(
              text: "Your cart is empty !",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),

          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            flex: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView.builder(
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final item = _cartItems[index];
                  return DismissibleWidget(
                    key: UniqueKey(),
                    image: item['image']!,
                    name: item['name']!,
                    price: "\$${item['price']}",
                    quantity: item['quantity']!,
                    itemCount: item['itemCount'] as int,
                    addOnTap: () {
                      _updateQuantity(index, (item['itemCount'] as int) + 1);
                    },
                    removeOnTap: () {
                      if ((item['itemCount'] as int) > 1) {
                        _updateQuantity(index, (item['itemCount'] as int) - 1);
                      }
                    },
                    onDismissed: () {
                      _deleteItem(index);
                    },
                    onQuantityChanged: (newQuantity) {
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
                child: Column(
                  children: [
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
                          text: "\$${_subtotal.toStringAsFixed(2)}",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
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
                          text: "\$${_shippingCharges.toStringAsFixed(2)}",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
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
                          text: "\$${_total.toStringAsFixed(2)}",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GreenButton(onTap: () {}, text: "Checkout"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
