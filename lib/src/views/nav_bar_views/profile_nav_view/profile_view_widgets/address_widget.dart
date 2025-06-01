
import  'package:grocery_app/src/controller/constant/linker.dart';

class AddressWidget extends StatelessWidget {

  String name;
  String address;
  String phone;

  AddressWidget({super.key,
    required this.name,
    required this.phone,
    required this.address
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
          Container(
              decoration: BoxDecoration(
                color: AppColors.greenColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(12),
              child: ImageIcon(AssetImage(AppImages.location),color: AppColors.greenColor,size: 25,)
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: name,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 2),
                BlackNormalText(
                  text: address,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  textColor: Colors.grey,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 2),
                BlackNormalText(
                  text: phone,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: Colors.black,
                  textAlign: TextAlign.left,
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
