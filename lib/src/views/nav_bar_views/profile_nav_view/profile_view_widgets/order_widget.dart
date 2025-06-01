import  'package:grocery_app/src/controller/constant/linker.dart';


class OrderWidget extends StatelessWidget {

  String orderNumber;
  String date;
  String item;
  String price;

   OrderWidget({super.key,
     required this.orderNumber,
     required this.date,
     required this.item,
     required this.price,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: "Order #$orderNumber",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2),
                BlackNormalText(
                  text: date,
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
                          text: item,
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
                          text: "\$$price",
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
    );
  }
}
