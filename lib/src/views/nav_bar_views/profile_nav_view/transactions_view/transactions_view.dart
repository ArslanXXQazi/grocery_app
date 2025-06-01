import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view_widgets/transactions_widget.dart';


class TransactionsView extends StatelessWidget {
   TransactionsView({super.key});

  @override

  final List <Map<String, dynamic>> _transactionList =[

    {
      "image" : AppImages.master,
      "cardName": "Master Card",
      "dateAndTime":"Dec 12 2021 at 10:00 pm",
      "price":"342"
    },
    {
      "image" : AppImages.visa,
      "cardName": "Master Card",
      "dateAndTime":"Dec 12 2021 at 10:00 pm",
      "price":"342"
    },
    {
      "image" : AppImages.master,
      "cardName": "Master Card",
      "dateAndTime":"Dec 12 2021 at 10:00 pm",
      "price":"342"
    },
    {
      "image" : AppImages.visa,
      "cardName": "Master Card",
      "dateAndTime":"Dec 12 2021 at 10:00 pm",
      "price":"342"
    },
    {
      "image" : AppImages.master,
      "cardName": "Master Card",
      "dateAndTime":"Dec 12 2021 at 10:00 pm",
      "price":"342"
    },
    {
      "image" : AppImages.visa,
      "cardName": "Master Card",
      "dateAndTime":"Dec 12 2021 at 10:00 pm",
      "price":"342"
    },

  ];

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: ListView.builder(
            itemCount: _transactionList.length,
            itemBuilder: (context,index){
              final card=_transactionList[index];
              return TransactionsWidget(
                  image: card['image'],
                  cardName: card['cardName']??"N/A",
                  dateAndTime: card['dateAndTime']??"N/A",
                  price: card['price']??"N/A"
              );
            }
            ),
      )
    );
  }
}
