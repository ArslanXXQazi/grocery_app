import  'package:grocery_app/src/controller/constant/linker.dart';


class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xffF4F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF4F5F9),
        centerTitle: true,
        title: BlackNormalText(
          text: "Password Recovery",
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(right: width*.04,left: width*.04,top: height*.1),
        child: Column(
          children: [
            BlackNormalText(
              text: "Forgot Password",
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: height*.015),
            BlackNormalText(
              text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
              fontSize: 15,
              fontWeight: FontWeight.w500,
              textColor: Colors.grey,
            ),
            SizedBox(height: height*.04),
            Form(
              key: formKey,
                child: Column(children: [
              TextFieldWidget(
                controller: emailController,
                hintText: "Email Address",
                prefixIcon: Image(
                  image: AssetImage(AppImages.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a Email";
                  }
                  return null;
                },
              ),
            ],)),
            SizedBox(height: height*.01),
            GreenButton(
              text: "Send Link",
              onTap: () {
                if (formKey.currentState!.validate())
                {

                }
              },
            ),
        ],),
      ),
    );
  }
}
