import 'package:cleanstyle/shared/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClosetScreen extends StatelessWidget {
  const ClosetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "All",
      "Shirts",
      "Pants",
      "Socks",
      "Shoes",
      "Accessories",
    ];

    final List<Map<String, dynamic>> clothes = [
      {
        "image":
            "https://thenorthfaceec.vteximg.com.br/arquivos/ids/187627-861-1000/NF0A4VSV8K2_1.jpg?v=638071553455200000",
        "label": "Gorra negra",
        "strColors": ["#3254a8", "#1c1b1c"],
      },
      {
        "image":
            "https://thenorthfaceec.vteximg.com.br/arquivos/ids/187627-861-1000/NF0A4VSV8K2_1.jpg?v=638071553455200000",
        "label": "Gorra azul",
        "strColors": ["#3254a8", "#1c1b1c"],
      },
      {
        "image":
            "https://thenorthfaceec.vteximg.com.br/arquivos/ids/187627-861-1000/NF0A4VSV8K2_1.jpg?v=638071553455200000",
        "label": "Gorra roja",
        "strColors": ["#3254a8", "#1c1b1c"],
      },
      {
        "image":
            "https://thenorthfaceec.vteximg.com.br/arquivos/ids/187627-861-1000/NF0A4VSV8K2_1.jpg?v=638071553455200000",
        "label": "Gorra roja",
        "strColors": ["#3254a8", "#1c1b1c"],
      },
      {
        "image":
            "https://thenorthfaceec.vteximg.com.br/arquivos/ids/187627-861-1000/NF0A4VSV8K2_1.jpg?v=638071553455200000",
        "label": "Gorra roja",
        "strColors": ["#3254a8", "#1c1b1c"],
      }
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.closet_title),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.map((category) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                label: Text(category),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 36.0,
                          child: const TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.search),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const SizedBox(
                                height: 40.0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Material(
                                        shape: CircleBorder(
                                          side: BorderSide(
                                            color: Colors.grey,
                                            width: 2.0,
                                          ),
                                        ),
                                        color: Colors.blueGrey,
                                        child: SizedBox(
                                          width: 24.0,
                                          height: 24.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text("#FFFFFF")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const CustomIcon(
                              iconInfo: Icons.favorite_outline,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const CustomIcon(
                              iconInfo: Icons.tune_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
                children: clothes.map((item) {
                  return ClotheCard(
                    image: item["image"],
                    label: item["label"],
                    strColors: List<String>.from(item["strColors"]),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/closet/add-clothe");
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0));
  }
}

class ClotheCard extends StatelessWidget {
  const ClotheCard({
    super.key,
    required this.image,
    required this.label,
    required this.strColors,
  });

  final String image;
  final String label;
  final List<String> strColors;
  final double widthCard = 160.0;
  final double heigthCard = 220.0;

  @override
  Widget build(BuildContext context) {
    final List<int> hexColors = strColors.map((color) {
      return int.parse(color.replaceFirst("#", "0xFF"));
    }).toList();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SizedBox(
        width: widthCard,
        height: heigthCard,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: widthCard,
                    height: widthCard,
                  ),
                ),
                const Positioned(
                  top: 6.0,
                  left: 6.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 16,
                    child: Icon(
                      Icons.thumb_up,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 6.0,
                  right: 6.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 16,
                    child: Icon(
                      Icons.favorite_outline,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(label),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: hexColors.map((color) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Material(
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      color: Color(color),
                      child: const SizedBox(
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.iconInfo,
  });

  final IconData iconInfo;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 40.0,
        height: 40.0,
        child: IconButton(
          icon: Icon(iconInfo),
          onPressed: () {},
        ),
      ),
    );
  }
}
