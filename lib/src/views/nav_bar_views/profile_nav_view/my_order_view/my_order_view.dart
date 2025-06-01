import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view_widgets/order_widget.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

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
            text: "My Order",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: ImageIcon(AssetImage(AppImages.gear)))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Column(children: [
                OrderWidget(
                    orderNumber: "46567",
                    date: "Placed on Octobar 19 2021",
                    item: "10",
                    price: "16"
                ),
                Divider(),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 40,
                          color: AppColors.greenColor,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BlackNormalText(
                        text: "Order placed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    BlackNormalText(
                      text: "Oct 19 2021",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textColor: Colors.grey,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 40,
                          color: AppColors.greenColor,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BlackNormalText(
                        text: "Order confirmed",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    BlackNormalText(
                      text: "Oct 19 2021",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textColor: Colors.grey,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 40,
                          color: AppColors.greenColor,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BlackNormalText(
                        text: "Order shipped",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    BlackNormalText(
                      text: "Oct 19 2021",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textColor: Colors.grey,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 40,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BlackNormalText(
                        text: "Out for delivery",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.grey,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    BlackNormalText(
                      text: "pending",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textColor: Colors.grey,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BlackNormalText(
                        text: "Order delivered",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.grey,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    BlackNormalText(
                      text: "pending",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      textColor: Colors.grey,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],),
            ),),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Column(children: [
             OrderWidget(
                 orderNumber: "46567",
                 date: "Placed on Octobar 19 2021",
                 item: "10",
                 price: "16"
             ),
             SizedBox(height: 20),
             OrderWidget(
                 orderNumber: "46567",
                 date: "Placed on Octobar 19 2021",
                 item: "10",
                 price: "16"
             ),
           ],),
         )
        ],),
      ),
    );
  }
}
