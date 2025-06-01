

import  'package:grocery_app/src/controller/constant/linker.dart';

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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Column(children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: AppColors.greenColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: ImageIcon(AssetImage(AppImages.box),color: AppColors.greenColor,size: 25,)
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlackNormalText(
                              text: "Order #90897 ",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              textColor: Colors.black,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 2),
                            BlackNormalText(
                              text: "Placed on Octobar 19 2021",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              textColor: Colors.grey,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    BlackNormalText(
                                      text: "item : ",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    BlackNormalText(
                                      text: "10",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    BlackNormalText(
                                      text: "item : ",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                    BlackNormalText(
                                      text: "\$16",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: Colors.black,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_circle_up_outlined, color: AppColors.greenColor),
                    ],
                  ),
                ),
                Divider()
              ],),
            ),
          )


        ],),
      ),
    );
  }
}
