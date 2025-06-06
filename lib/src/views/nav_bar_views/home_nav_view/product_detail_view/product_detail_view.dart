
import  'package:grocery_app/src/controller/constant/linker.dart';

class ProductDetailView extends StatefulWidget {

  String name;
  String price;
  String image;
  String quantity;
  ProductDetailView({super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int itemCount=1;
  double get totalPrice => double.parse(widget.price)*itemCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [

        //=================================>> 1st Container For Images
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 370,
                width: double.infinity,
                child: Image.asset(widget.image),
              ),
            ],
          )
        ),
        Padding(
          padding: const EdgeInsets.only(top: 380),
          child: Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlackNormalText(
                      text: "\$${widget.price}",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      textColor: AppColors.greenColor,
                    ),
                    InkWell(
                      onTap: (){},
                        child: Image(image: AssetImage(AppImages.heart)))
                  ],
                ),
                BlackNormalText(
                  text: widget.name,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                  const SizedBox(height: 5),
                BlackNormalText(
                  text: widget.quantity,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.grey,
                ),
                  const SizedBox(height: 20),
                  Row(children: [
                    BlackNormalText(
                      text: "4.5",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
                    BlackNormalText(
                      text: "(89 reviews)",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      textColor: Colors.grey,
                    ),
                  ],),
                  const SizedBox(height: 20),
                  BlackNormalText(
                    text: "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.grey,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),

                  //=============>> Container for Add AnD Remove Button
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(children: [
                        BlackNormalText(
                          text: "Quantity",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.grey,
                        ),
                        Spacer(),
                        IconButton(

                            onPressed: (){
                              setState(() {
                                if (itemCount > 1) {
                                  itemCount--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove),color: AppColors.greenColor,),
                        Container(
                          height: 60,
                          width: 2,
                          color: AppColors.greyColor,
                        ),
                        const SizedBox(width: 20),
                        BlackNormalText(
                          text: itemCount.toString(),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 60,
                          width: 2,
                          color: AppColors.greyColor,
                        ),
                        IconButton(
                          onPressed: (){
                            setState(() {});
                            itemCount ++;
                          },
                          icon: Icon(Icons.add),color: AppColors.greenColor,),
                      ],),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //=============================== Row For Total Amount
                  Row(
                    children: [
                      BlackNormalText(
                        text: "Total :",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const SizedBox(width: 10),
                      BlackNormalText(
                        text: "\$${totalPrice.toStringAsFixed(2)}",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        textColor: AppColors.greenColor,
                      ),
                    ],
                  ),

                  //============================ Button For Add To Cart
                  const SizedBox(height: 20),
                  GreenButton(onTap: (){}, text: "Add to cart"),
              ],),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(onPressed: (){
            Get.back();
          },
              icon: Icon(Icons.arrow_back_rounded)),
        )
      ],),
    );
  }
}
