import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster/model/product_class.dart';

import '../utils/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  Text("Cupertino Store",
                      style: cupertinoTextStyle.copyWith(fontSize: 30)),
                  const Divider(color: Colors.black38),
                ],
              ),
            ),
            Expanded(
              child: Container(
              color: Colors.white24,
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                    itemCount: Product.productList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Product product = Product.productList[index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(product.images),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.title,
                                        style: cupertinoTextStyle),
                                    SizedBox(height: 10),
                                    Text("\$${product.price}",
                                        style: cupertinoTextStyle),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: 30,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: CupertinoColors.systemBlue)),
                                  child: Icon(CupertinoIcons.add,
                                      color: CupertinoColors.systemBlue,
                                      size: 15),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Divider(
                              indent: MediaQuery.of(context).size.width * 0.30,
                              height: 0),
                        ],
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
