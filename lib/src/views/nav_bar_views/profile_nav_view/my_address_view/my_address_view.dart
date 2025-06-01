import  'package:grocery_app/src/controller/constant/linker.dart';
import 'package:grocery_app/src/views/nav_bar_views/profile_nav_view/profile_view_widgets/address_widget.dart';

class MyAddressView extends StatefulWidget {
  const MyAddressView({super.key});

  @override
  State<MyAddressView> createState() => _MyAddressViewState();
}

class _MyAddressViewState extends State<MyAddressView> {
  TextEditingController nameController = TextEditingController();
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
      backgroundColor: Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F5F9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BlackNormalText(
          text: 'My Address',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          textColor: Colors.black,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DEFAULT label
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Color(0xFFD8F1A0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: BlackNormalText(
                  text: 'DEFAULT',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  textColor: Color(0xFF6CC51D),
                ),
              ),
              // Russell Austin Card
             AddressWidget(
                 name: "Arslan Qazi",
                 phone: "+923483424529",
                 address: "2811 Crescent Day. LA Port California, United States 77571"
             ),
              SizedBox(height: 18),
              // TextFields
              TextFieldWidget(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
              ),
              SizedBox(height: 12),
              TextFieldWidget(
                controller: addressController,
                hintText: 'Address',
                prefixIcon: Icon(Icons.location_on_outlined, color: Colors.grey),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: cityController,
                      hintText: 'City',
                      prefixIcon: Icon(Icons.location_city, color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFieldWidget(
                      controller: zipController,
                      hintText: 'Zip code',
                      prefixIcon: Icon(Icons.local_post_office_outlined, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Country field
              CountryFieldWidget(
                countries: countries,
                selectedCountry: selectedCountry,
                onChanged: (val) {
                  setState(() {
                    selectedCountry = val;
                  });
                },
              ),
              SizedBox(height: 12),
              TextFieldWidget(
                controller: phoneController,
                hintText: 'Phone number',
                prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 12),
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
                      activeColor: Color(0xFF6CC51D),
                    ),
                  ),
                  BlackNormalText(
                    text: 'Make default',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 15),
              AddressWidget(
                  name: "Arslan Qazi",
                  phone: "+923483424529",
                  address: "2811 Crescent Day. LA Port California, United States 77571"
              ),
              SizedBox(height: 30),
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
