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
      body: ListView.builder(
          itemCount: ,
          itemBuilder:
          )
    );
  }
}
