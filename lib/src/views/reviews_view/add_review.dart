import 'package:animated_rating_stars/animated_rating_stars.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';


class AddReview extends StatelessWidget {
  const AddReview({super.key});

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
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: [
            BlackNormalText(
              text: "What do you think ?",
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 20),
            BlackNormalText(
              text: "please give your rating by clicking on\nthe stars below",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              textColor: Colors.grey,
            ),
              const SizedBox(height: 20),
              AnimatedRatingStars(
                onChanged: (double rating) {
                  // Handle the rating change here
                  print('Rating: $rating');
                },
                  customFilledIcon: Icons.star,
                  customEmptyIcon: Icons.star,
                  customHalfFilledIcon: Icons.star_half,
                  starSize: 50,
                  emptyColor: Colors.white,
              ),
              const SizedBox(height: 20),
          ],),
        ),
      ),
    );
  }
}
