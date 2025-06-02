import 'package:animated_rating_stars/animated_rating_stars.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';


class AddReview extends StatelessWidget {
  AddReview({super.key});
  final TextEditingController reviewController=TextEditingController();
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
            text: "Write Reviews",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
            BlackNormalText(
              text: "What do you think ?",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10),
              BlackNormalText(
              text: "please give your rating by clicking on\nthe stars below",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textColor: Colors.grey,
            ),
              const SizedBox(height: 20),
              AnimatedRatingStars(
                onChanged: (double rating) {
                  print('Rating: $rating');
                },
                  customFilledIcon: Icons.star,
                  customEmptyIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  starSize: 50,
                  emptyColor: Colors.white,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                  controller: reviewController,
                  hintText: "Tell us about your experience",
                  maxLine: 5,
              ),
              const SizedBox(height: 30),
              GreenButton(
                  onTap: (){},
                  text: "Add Review"
              )

          ],),
        ),
      ),
    );
  }
}
