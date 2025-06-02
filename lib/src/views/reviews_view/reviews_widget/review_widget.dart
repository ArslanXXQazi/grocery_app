
import  'package:grocery_app/src/controller/constant/linker.dart';


class ReviewWidget extends StatelessWidget {

  String? image;
  String? name;
  String? time;
  String? ratting;
  String? comment;

  ReviewWidget({super.key,
    this.image,
    this.name,
    this.time,
    this.ratting,
    this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin:  const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(image!),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: name,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                BlackNormalText(
                  text: time,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  textColor: Colors.grey,
                ),
              ],
            )
          ],),
          const SizedBox(height: 10),
          Divider(),
          const SizedBox(height: 10),
          Row(children: [
            BlackNormalText(
              text: ratting,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
            Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
            Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
            Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
            Icon(Icons.star,color: Colors.yellow.shade700,size: 20,),
          ],),
          BlackNormalText(
            text: comment,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            textColor: Colors.grey,
            textAlign: TextAlign.start,
          )
        ],),
    );
  }
}
