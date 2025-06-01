import  'package:grocery_app/src/controller/constant/linker.dart';


class TransactionsWidget extends StatelessWidget {

  String image;
  String cardName;
  String dateAndTime;

   TransactionsWidget({super.key,
     required this.image,
     required this.cardName,
     required this.dateAndTime,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
            child: Image.asset(AppImages.visa),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: "cardName",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
                BlackNormalText(
                  text: "Dec 12 2021 at 10:00 pm",
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          BlackNormalText(
            text: "\$45",
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
