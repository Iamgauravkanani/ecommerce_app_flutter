import 'package:ecommerce_cf_9/utils/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ecommerce_cf_9/Screens/home_page.dart';
import '../Model/model.dart';

Widget getProduct({required String category, required String displayname}) {
  return Builder(builder: (context) {
    double h = MediaQuery.of(context).size.height * 0.45;
    double w = MediaQuery.of(context).size.width * 0.5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            displayname,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
              children: Allproducts.map((e) => (e['category'] == category)
                  ? Builder(
                    builder: (ctx) {
                      return GestureDetector(
                          onTap: () {
                            Product p1 = Product(
                              id: e['id'],
                              brand: e['brand'],
                              category: e['category'],
                              description: e['description'],
                              discountPercentage: e['discountPercentage'],
                              images: e['images'],
                              price: e['price'],
                              rating: e['rating'],
                              stock: e['stock'],
                              thumbnail: e['thumbnail'],
                              title: e['title'],
                            );
                            print("===========================================");
                            print(p1);
                            print("===========================================");
                            Navigator.of(context)
                                .pushNamed('detail', arguments: p1);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            height: h,
                            width: w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                          image: DecorationImage(
                                              image: NetworkImage(e['thumbnail']),
                                              fit: BoxFit.cover),
                                        ),
                                        // child: Image.asset("lib/Assets/Image/monkeybhai.jpg"),
                                        // child: Image.network(
                                        //   "https://gifdb.com/images/high/goofy-dancing-monkey-ar6ploj3u3zrtlru.gif",
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffb71c1c),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${e['discountPercentage'].toString()}%",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: w,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            e['title'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text(
                                            "\$ ${e['price'].toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: RatingBarIndicator(
                                            rating: e['rating'].toDouble(),
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 20,
                                            direction: Axis.horizontal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                    }
                  ):Container(child:Text("Atlu badhu nai ....."))
                  : Container()).toList()),
        ),
      ],
    );
  });
}
