import  'package:grocery_app/src/controller/constant/linker.dart';


class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

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
            text: "Transactions",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(children: [
            Container(
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
                  CircleAvatar(
                    radius: 33,
                    backgroundColor: AppColors.greyColor,
                    child: Image.asset(AppImages.visa),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlackNormalText(
                          text: "cardName",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          textColor: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 5),
                        BlackNormalText(
                          text: "cardName",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          textColor: Colors.black,
                          textAlign: TextAlign.left,
                        ),

                      ],
                    ),
                  ),
                  Icon(Icons.arrow_circle_up_outlined, color: AppColors.greenColor),
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }
}
