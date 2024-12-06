import 'package:cleanstyle/shared/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddClotheScreen extends StatelessWidget {
  const AddClotheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final List<String> clotheTypes = [
      "All",
      "Shirts",
      "Pants",
      "Socks",
      "Shoes",
      "Accessories",
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                "https://thenorthfaceec.vteximg.com.br/arquivos/ids/187627-861-1000/NF0A4VSV8K2_1.jpg?v=638071553455200000",
                width: screenWidth * 0.7,
                height: screenWidth * 0.7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  const Text("Gorra Negra"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.add_clothe_palette),
                      const Row(
                        children: [
                          Material(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            color: Colors.black,
                            child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Material(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            color: Colors.black,
                            child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.add_clothe_type),
                      DropdownButton<String>(
                        items: clotheTypes.map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? value) {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
