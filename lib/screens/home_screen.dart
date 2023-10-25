import 'package:app_mania/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownvalue = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade500,
          centerTitle: true,
          leading: const Icon(Icons.location_on_sharp),
          title: const Text(
            "Habiganj City",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'cart');
                });
              },
              child: const Icon(
                Icons.add_shopping_cart_sharp,
                size: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Find The ",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 30, color: Colors.black),
                  ),
                  Text(
                    "Best",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Food ",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Around You",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: dropdownvalue,
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: [
                    const DropdownMenuItem(
                        value: "",
                        child: Text("Select list")),
                    ...drop.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(
                        value: e['value'],
                        child: Text(e["name"]),
                      );
                    }).toList(),
                  ],
                  onChanged: (value) {
                    setState(() {
                      dropdownvalue = value!;
                      // print("SelectedCovervalue");
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " Find ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "5 km>",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                width: 600,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Salads",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Hot Sale",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Popularity",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  children: food
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'foodpage',
                                arguments: e);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    )),
                                Image.asset("${e['img']}", height: 92),
                                Text(
                                  "${e['name']}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      "20 min",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${e['price']}",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 16,
                                      width: 16,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: const Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
