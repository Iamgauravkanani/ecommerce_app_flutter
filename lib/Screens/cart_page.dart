import 'package:ecommerce_cf_9/utils/product_list.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var TotalAmount = 0;

  @override
  void initState() {
    super.initState();
    Addedproducts.forEach((ele) {
      TotalAmount += ele.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          "Cart Page",
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
        child: Column(children: [
          ...Addedproducts.map(
            (e) => Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    const BoxShadow(blurRadius: 5, color: Colors.grey),
                  ]),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(e.thumbnail),
                            fit: BoxFit.cover)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "\$ ${e.price.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Addedproducts.remove(e);
                              TotalAmount -= e.price;
                            });
                          },
                          child: const Text("Remove Product"))
                    ],
                  )
                ],
              ),
            ),
          ).toList(),
          Text(
            "Total Price : $TotalAmount ",
            style: const TextStyle(fontSize: 22),
          )
        ]),
      ),
    );
  }
}
