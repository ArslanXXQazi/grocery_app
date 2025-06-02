import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/reviews_view/add_review.dart';
import 'package:grocery_app/src/views/reviews_view/reviews_widget/review_widget.dart';


class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

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
            text: "Reviews",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Get.to(AddReview());
                },
                icon: Icon(Icons.add_circle_outline_rounded)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(children: [
            ReviewWidget(
              image: AppImages.fruits,
              name: "Arslan Qazi",
              time: "32 minutes ago",
              ratting: "5",
              comment: "Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy",
            ),
            ReviewWidget(
              image: AppImages.fruits,
              name: "Arslan Qazi",
              time: "32 minutes ago",
              ratting: "5",
              comment: "Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy",
            ),
            ReviewWidget(
              image: AppImages.fruits,
              name: "Arslan Qazi",
              time: "32 minutes ago",
              ratting: "5",
              comment: "Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy",
            ),
            ReviewWidget(
              image: AppImages.fruits,
              name: "Arslan Qazi",
              time: "32 minutes ago",
              ratting: "5",
              comment: "Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy",
            ),
            ReviewWidget(
              image: AppImages.fruits,
              name: "Arslan Qazi",
              time: "32 minutes ago",
              ratting: "5",
              comment: "Lorem ipsum dolor sit amet, consetetur sadi sspscing elitr, sed diam nonumy",
            ),

          ],),
        ),
      ),
    );
  }
}
