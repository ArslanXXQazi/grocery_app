import 'package:flutter/material.dart';


class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String groupValue='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
       Row(children: [
         Text('Male:'),
         Radio(
             value: 'male',
             groupValue: groupValue,
             onChanged: (value){
               groupValue=value.toString();
               setState(() {

               });
             }),
       ],),
        Radio(
            value: 'female',
            groupValue: groupValue,
            onChanged: (value){
              groupValue=value.toString();
              setState(() {

              });
            }),
        Radio(
            value: 'others',
            groupValue: groupValue,
            onChanged: (value){
              groupValue=value.toString();
              setState(() {

              });
            }),
      ],),
    );
  }
}
