
import  'package:grocery_app/src/controller/constant/linker.dart';
class AddCreditCard extends StatelessWidget {
  AddCreditCard({super.key});

  TextEditingController nameController=TextEditingController();
  TextEditingController carNumberController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController cvvController=TextEditingController();

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
          actions: [
            IconButton(
                onPressed: (){Get.toNamed(AppRoutes.addCreditCard);},
                icon: Icon(Icons.add_circle_outline_rounded,color: Colors.black,))
          ],
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
                  child: Image.asset(AppImages.orders,fit: BoxFit.cover,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage(AppImages.phone)),
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
                    )




                  ],),
              )
            ],
          ),

          SizedBox(height: 20),

          TextFieldWidget(
            controller: nameController,
            hintText: "Arslan Qazi",
            prefixIcon: Icon(Icons.person,color: Colors.grey,),
          ),
          SizedBox(height: 10),
          TextFieldWidget(
            controller: carNumberController,
            hintText: "XXXX  XXXX  XXXX  5678",
            prefixIcon: Icon(Icons.wallet,color: Colors.grey,),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  controller: dateController,
                  hintText: "01/22",
                  prefixIcon: Icon(Icons.calendar_month,color: Colors.grey,),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFieldWidget(
                  controller: cvvController,
                  hintText: "346",
                  prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.grey,),
                  keyboardType: TextInputType.number,
                ),
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
