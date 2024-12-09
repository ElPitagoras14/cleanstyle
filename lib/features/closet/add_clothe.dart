import 'package:cleanstyle/shared/widgets/custom_bottom_navigation_bar.dart';
import 'package:cleanstyle/shared/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddClotheScreen extends StatelessWidget {
  const AddClotheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final List<DropdownMenuEntry<String>> clotheTypes = [
      const DropdownMenuEntry(value: "all", label: "All"),
      const DropdownMenuEntry(value: "shirt", label: "Shirts"),
      const DropdownMenuEntry(value: "pants", label: "Pants"),
      const DropdownMenuEntry(value: "socks", label: "Socks"),
      const DropdownMenuEntry(value: "shoes", label: "Shoes"),
      const DropdownMenuEntry(value: "accessories", label: "Accessories"),
    ];
    final List<DropdownMenuEntry<String>> styles = [
      const DropdownMenuEntry(value: "casual", label: "Casual"),
      const DropdownMenuEntry(value: "formal", label: "Formal"),
      const DropdownMenuEntry(value: "elegant", label: "Elegant"),
    ];
    final List<DropdownMenuEntry<String>> brands = [
      const DropdownMenuEntry(value: "hm", label: "HM"),
      const DropdownMenuEntry(value: "zara", label: "zara"),
      const DropdownMenuEntry(value: "lv", label: "Luis Victor"),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
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
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomAddOption(
                    label: AppLocalizations.of(context)!.add_clothe_type,
                    options: clotheTypes,
                  ),
                  CustomAddOption(
                    label: AppLocalizations.of(context)!.add_clothe_style,
                    options: styles,
                  ),
                  CustomAddOption(
                    label: AppLocalizations.of(context)!.add_clothe_brand,
                    options: brands,
                  ),
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

class CustomAddOption extends StatelessWidget {
  const CustomAddOption({
    super.key,
    required this.label,
    required this.options,
  });

  final String label;
  final List<DropdownMenuEntry<String>> options;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        SizedBox(
          width: 160.0,
          child: CustomDropdown(options: options),
        )
      ],
    );
  }
}
