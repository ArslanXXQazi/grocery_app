import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view_widgets/address_widget.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isDefault = true;
  String? selectedCountry;
  final List<String> countries = [
    'Pakistan', 'India', 'USA', 'UK', 'Canada', 'Australia'
  ];

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
            text: "Add Address",
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextFields
              TextFieldWidget(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: ImageIcon(AssetImage(AppImages.person),color: Colors.grey,),
              ),
              SizedBox(height: 5),
              TextFieldWidget(
                controller: emailController,
                hintText: 'Email Adress',
                prefixIcon: ImageIcon(AssetImage(AppImages.email),color: Colors.grey,),
              ),
              SizedBox(height: 5),
              TextFieldWidget(
                controller: addressController,
                hintText: 'Address',
                prefixIcon: ImageIcon(AssetImage(AppImages.location),color: Colors.grey,),
              ),
              SizedBox(height: 5),
              TextFieldWidget(
                controller: cityController,
                hintText: 'City',
                prefixIcon: ImageIcon(AssetImage(AppImages.city),color: Colors.grey,),
              ),
              SizedBox(height: 5),
              TextFieldWidget(
                controller: zipController,
                hintText: 'Zip code',
                prefixIcon: ImageIcon(AssetImage(AppImages.zip),color: Colors.grey,),
              ),
              SizedBox(height: 5),
              TextFieldWidget(
                controller: phoneController,
                hintText: 'Phone number',
                prefixIcon: ImageIcon(AssetImage(AppImages.phone),color: Colors.grey,),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 5),
              CountryFieldWidget(
                countries: countries,
                selectedCountry: selectedCountry,
                onChanged: (val) {
                  setState(() {
                    selectedCountry = val;
                  });
                },
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
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
                  ),
                  BlackNormalText(
                    text: 'Make Default',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 20),
              GreenButton(
                text: 'Save settings',
                onTap: () {},
                height: 55,
                fontSize: 17,
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
