
import  'package:grocery_app/src/controller/constant/linker.dart';
class AddCreditCard extends StatefulWidget {
  AddCreditCard({super.key});

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
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
            text: "Add Credit Cards",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 190,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                       colors: [
                         Color(0xffAEDC81),
                         Color(0xff6CC51D),
                       ]
                   ),
                 ),
                //  child: Image.asset(AppImages.orders,fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                            child: Image(image: AssetImage(AppImages.master))),
                        InkWell(
                            onTap: (){},
                            child: Icon(Icons.more_vert,color: Colors.white,))
                      ],
                    ),
                    BlackNormalText(
                      text: "XXXX  XXXX  XXXX  5678",
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlackNormalText(
                                text: "Card Holder",
                                textColor: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                              BlackNormalText(
                                text: "Arslan Qazi",
                                textColor: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlackNormalText(
                                text: "Expires",
                                textColor: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                              BlackNormalText(
                                text: "01 / 22",
                                textColor: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ],
                          ),

                        ],),
                    )],),
              )
            ],
          ),

          SizedBox(height: 20),

          TextFieldWidget(
            controller: nameController,
            hintText: "Name on the card",
           prefixIcon: ImageIcon(AssetImage(AppImages.person),color: Colors.grey,),
          ),
          SizedBox(height: 10),
          TextFieldWidget(
            controller: carNumberController,
            hintText: "Card number",
            prefixIcon: ImageIcon(AssetImage(AppImages.card),color: Colors.grey,),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  controller: dateController,
                  hintText: "Month / Year",
                  prefixIcon: ImageIcon(AssetImage(AppImages.calendar),color: Colors.grey,),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: TextFieldWidget(
                  controller: cvvController,
                  hintText: "CVV",
                  prefixIcon: ImageIcon(AssetImage(AppImages.lock),color: Colors.grey,),
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
                text: 'Save this card',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textColor: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 20),
          GreenButton(
           onTap: (){},
            text: "Add Credit Card",
          )
        ],),
      ),
    );
  }
}
