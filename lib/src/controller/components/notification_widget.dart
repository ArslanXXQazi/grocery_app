import  'package:grocery_app/src/controller/constant/linker.dart';

class NotificationWidget extends StatefulWidget {

  String title;
  String description;

   NotificationWidget({super.key,
     required this.title,
     required this.description,
   });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool isDefault=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      margin:  const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlackNormalText(
                  text: widget.title,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,

                ),
                const SizedBox(height: 25),
                BlackNormalText(
                  text: widget.description,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  textColor: Colors.grey,
                  textAlign: TextAlign.start,
                ),
              ],),
          ),
          const SizedBox(width: 5),
          Transform.scale(
            scale: 0.8, child: Switch(
            value: isDefault,
            onChanged: (val) {
              setState(() {
                isDefault = val;
              });
            },
            activeColor: AppColors.greenColor, // Background green jab on ho
            thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.white; // Dot white jab switch on ho
              }
              return Colors.grey; // Dot grey jab switch off ho
            }),
          ),
          )
        ],
      ),
    );
  }
}
