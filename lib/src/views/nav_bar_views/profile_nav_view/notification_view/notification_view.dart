import 'package:grocery_app/src/controller/components/notification_widget.dart';
import  'package:grocery_app/src/controller/constant/linker.dart';


class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  bool isDefault=true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: BlackNormalText(
            text: "Notifications",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(children: [

           NotificationWidget(
               title: "Allow Notifications",
               description: "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym"
           ),
           NotificationWidget(
               title: "Email Notifications",
               description: "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym"
           ),
           NotificationWidget(
               title: "Order Notifications",
               description: "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym"
           ),
           NotificationWidget(
               title: "General Notifications",
               description: "Lorem ipsum dolor sit amet, consetetur sadi pscing elitr, sed diam nonumym"
           ),

          ],),
        ),
      ),
    );
  }
}
