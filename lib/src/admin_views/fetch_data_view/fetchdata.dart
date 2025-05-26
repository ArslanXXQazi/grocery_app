

import  'package:grocery_app/src/controller/constant/linker.dart';


class FetchData extends StatefulWidget {
  final String category;
  const FetchData({super.key,
    required this.category,

  });

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.greyColor,
        centerTitle: true,
        title: BlackNormalText(
          text: "${widget.category} Data",
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Get.toNamed(AppRoutes.addData,arguments: {'collection':widget.category});
        },
        child: BlackNormalText(
          text: "Add Data",
          textColor: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(widget.category).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Apploader3();
            } else if (snapshot.hasError) {
              return Center(child: BlackNormalText(text: "Error ${snapshot.hasError}"));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: BlackNormalText(text: "No ${widget.category} Found",fontWeight: FontWeight.w700,fontSize: 25,));
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // 2 columns for 2 items per row
                  crossAxisSpacing: 20,
                  // No extra spacing, margin will handle it
                  mainAxisSpacing: 0,
                  // No extra spacing
                  childAspectRatio: 0.8, // Adjust for your container's size
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return UpdateDataButton(

                    //============================>>> Update OnTap
                    upDateOnTap: () {
                      Get.back();
                      Get.toNamed(
                        AppRoutes.updateDataView,
                        arguments: {
                          'id': data.id,
                          'name': data['name'] ?? 'N/A',
                          'price': data['price'] ?? 'N/A',
                          'quantity': data['quantity'] ?? 'N/A',
                          'collection':widget.category,
                        },
                      );
                    },

                    //============================>>> Delete  OnTap
                    deleteOnTap: () {
                      adminController.deleteData(data.id,widget.category);
                    },

                    itemCount: (index+1).toString(),
                    price: data['price'] ?? 'n/a',
                    name: data['name'] ?? 'N/A',
                    kg: data['quantity'] ?? "N/A",
                  );
                },
              );
            }
          },
        ),
      ),

    );
  }
}
