import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view_widgets/credit_card_widget.dart';
class CreditCardView extends StatefulWidget {
  CreditCardView({super.key});

  @override
  State<CreditCardView> createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  TextEditingController nameController=TextEditingController();

  TextEditingController carNumberController=TextEditingController();

  TextEditingController dateController=TextEditingController();

  TextEditingController cvvController=TextEditingController();

  bool isDefault = true;

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
            text: "My Cards",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
                onPressed: (){Get.toNamed(AppRoutes.addCreditCard);},
                icon: Icon(Icons.add_circle_outline_rounded,color: Colors.black,))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                CreditCardWidget(
                    image: AppImages.master,
                    cardName: "Master Card",
                    cardNumber: "XXXX  XXXX  XXXX  5678",
                    date: '3/4',
                    cvv: '274'
                ),
                SizedBox(height: 20),
                TextFieldWidget(
                  controller: nameController,
                  hintText: "Arslan Qazi",
                  prefixIcon: ImageIcon(AssetImage(AppImages.person),color: Colors.grey,),
                  fillColor: AppColors.greyColor,
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  controller: carNumberController,
                  hintText: "XXXX  XXXX  XXXX  5678",
                  prefixIcon: ImageIcon(AssetImage(AppImages.card),color: Colors.grey,),
                  fillColor: AppColors.greyColor,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        controller: dateController,
                        hintText: "01/22",
                        prefixIcon: ImageIcon(AssetImage(AppImages.calendar),color: Colors.grey,),
                        fillColor: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFieldWidget(
                        controller: cvvController,
                        hintText: "346",
                        prefixIcon: ImageIcon(AssetImage(AppImages.lock),color: Colors.grey,),
                        fillColor: AppColors.greyColor,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: isDefault,
                        onChanged: (val) {
                          setState(() {
                            isDefault = val;
                          });
                        },
                        activeColor: AppColors.greenColor, // Background green jab on ho
                        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.white; // Dot white jab switch on ho
                          }
                          return Colors.grey; // Dot grey jab switch off ho
                        }),
                      ),
                    ),
                    BlackNormalText(
                      text: 'Make Default',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],),
            ),
            CreditCardWidget(
                image: AppImages.visa,
                cardName: "Visa Card",
                cardNumber: "XXXX  XXXX  XXXX  5678",
                date: '3/4',
                cvv: '274'
            ),
            SizedBox(height: 20),
            GreenButton(
              onTap: (){
              },
              text: "Save Settings",
            )
          ],),
        ),
      ),
    );
  }
}
