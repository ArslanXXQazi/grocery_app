
import  'package:grocery_app/src/controller/constant/linker.dart';
class CreditCardWidget extends StatelessWidget {

  String image;
  String cardName;
  String cardNumber;
  String date;
  String cvv;


  CreditCardWidget({super.key,

    required this.image,
    required this.cardName,
    required this.cardNumber,
    required this.date,
    required this.cvv,

  });

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                  text: cardNumber,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  textColor: Colors.grey,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                Row(children: [
                  Row(
                    children: [
                      BlackNormalText(
                        text: 'Expiry ',
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                      BlackNormalText(
                        text: ': $date',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      BlackNormalText(
                        text: 'CVV ',
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                      BlackNormalText(
                        text: ': $cvv',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        textColor: Colors.black,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],)
              ],
            ),
          ),
          Icon(Icons.arrow_circle_up_outlined, color: AppColors.greenColor),
        ],
      ),
    );
  }
}
