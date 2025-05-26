import  'package:grocery_app/src/controller/constant/linker.dart';


class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Dismissible(
        key: Key("item_key"),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (direction) {

          print("Item deleted");
        },
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Row(children: [
            Container(
              height: 100,
              width: 100,
              child: Image(image: AssetImage(AppImages.avacoda)),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: "2.22 x 4",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  textColor: AppColors.greenColor,
                ),
                BlackNormalText(
                  text: "Black Grapes",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                BlackNormalText(
                  text: "5.0 lbs",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
              ],
            ),
            Spacer(),
            Column(children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.add),color: AppColors.greenColor,),
              BlackNormalText(
                text: "5",
                fontSize: 15,
                fontWeight: FontWeight.w500,
                textColor: Colors.grey,
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.remove),color: AppColors.greenColor,)
            ],)
          ],),
        )
    );
  }
}
