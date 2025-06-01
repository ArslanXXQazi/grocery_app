import  'package:grocery_app/src/controller/constant/linker.dart';


class TransactionsWidget extends StatelessWidget {

  String image;
  String cardName;
  String dateAndTime;
  String price;

   TransactionsWidget({super.key,
     required this.image,
     required this.cardName,
     required this.dateAndTime,
     required this.price,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin:  const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: AppColors.greyColor,
            child: Image.asset(image),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: cardName,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                BlackNormalText(
                  text: dateAndTime,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          BlackNormalText(
            text: "\$$price",
            fontWeight: FontWeight.w600,
            fontSize: 15,
            textColor: AppColors.greenColor,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
