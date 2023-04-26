import 'dart:core';
import 'package:ecommerce_cf_9/utils/product_list.dart';
import 'package:flutter/material.dart';
import '../utils/my_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  //Create-state
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectcategory;
  RangeValues rangeValues = const RangeValues(1, 2000);
  @override
  //initstate
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  //build
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                      value: selectcategory,
                      hint: const Text("Select category..."),
                      items: Category.map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ),
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectcategory = val;
                        });
                      }),
                ),
                Visibility(
                  visible: selectcategory != null,
                  child: ActionChip(
                    avatar: const Icon(Icons.clear),
                    label: const Text("Clear"),
                    onPressed: () {
                      setState(() {
                        selectcategory = null;
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: selectcategory != null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text("From \n\$ ${rangeValues.start.toInt()}"),
                    Expanded(
                      child: RangeSlider(
                        divisions: 2000,
                        min: 1,
                        max: 2000,
                        values: rangeValues,
                        onChanged: (val) {
                          setState(() {
                            rangeValues = val;
                          });
                        },
                      ),
                    ),
                    Text("From \n\$ ${rangeValues.end.toInt()}"),
                  ],
                ),
              ),
            ),
            (selectcategory != null)
                ? getProduct(
                    category: selectcategory!,
                    displayname: selectcategory!,
                    min: rangeValues.start,
                    max: rangeValues.end,
                  )
                : Column(
                    children: [
                      getProduct(
                          category: 'smartphones', displayname: 'SmartPhone'),
                      getProduct(category: 'laptops', displayname: 'Laptops'),
                      getProduct(
                          category: 'fragrances', displayname: 'Fragrances'),
                      getProduct(
                          category: 'skincare', displayname: 'Skin-Care'),
                      getProduct(
                          category: 'groceries', displayname: 'Kariyanu'),
                      getProduct(
                          category: 'home-decoration',
                          displayname: 'Ghar-Shangar'),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
