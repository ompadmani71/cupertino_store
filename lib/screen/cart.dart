import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/product_class.dart';
import '../utils/textstyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String deliveryTime = "";
  int shipping = 0;

  @override
  void initState() {
    super.initState();
    deliveryTime = DateFormat("MMM d, yyyy h:mm a").format(DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    // shipping = 0;
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("Shopping Cart",
                  style: cupertinoTextStyle.copyWith(fontSize: 30)),
            ),
            const Divider(color: Colors.black38),
            CupertinoTextField.borderless(
              placeholder: "Name",
              prefix: Row(
                children: const [
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.profile_circled,
                    color: CupertinoColors.systemGrey2,
                  ),
                ],
              ),
            ),
            const Divider(height: 2, thickness: 1),
            CupertinoTextField.borderless(
              placeholder: "Email",
                decoration: const BoxDecoration(),
                prefix: Row(
                  children: const [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      CupertinoIcons.mail,
                      color: CupertinoColors.systemGrey2,
                    ),
                  ],
                )),
            const Divider(height: 2, thickness: 1),
            CupertinoTextField.borderless(
              placeholder: "Location",
              prefix: Row(
                children: const [
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.location,
                    color: CupertinoColors.systemGrey2,
                  ),
                ],
              ),
            ),
            const Divider(height: 2, thickness: 1),
            Row(
              children: [
                const SizedBox(width: 5),
                const Icon(CupertinoIcons.clock,
                    color: CupertinoColors.systemGrey2),
                const SizedBox(width: 5),
                Text("Delivery Time",
                    style: cupertinoTextStyle.copyWith(
                        color: CupertinoColors.systemGrey2)),
                const Spacer(),
                Text(deliveryTime,
                    style: cupertinoTextStyle.copyWith(
                        color: CupertinoColors.systemGrey)),
              ],
            ),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(onDateTimeChanged: (value) {
                setState(() {
                  deliveryTime = DateFormat("MMM d, yyyy h:mm a").format(value);
                });
              }),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: false,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: Product.productList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 1 || index == 4 || index == 9 || index == 11) {
                    Product product = Product.productList[index];
                    shipping = 198;
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
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
                                  style: cupertinoTextStyle.copyWith(
                                      fontSize: 12,
                                      color: CupertinoColors.label)),
                              const SizedBox(height: 5),
                              Text("\$${product.price}",
                                  style: cupertinoTextStyle.copyWith(
                                      fontSize: 10,
                                      color: CupertinoColors.secondaryLabel)),
                            ],
                          ),
                          const Spacer(),
                          Text("\$${product.price}",
                              style: cupertinoTextStyle.copyWith(
                                  fontSize: 15, color: CupertinoColors.label)),
                          const SizedBox(width: 10),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Shipping \$198", style: cupertinoTextStyle.copyWith(color: CupertinoColors.secondaryLabel)),
                  const SizedBox(height: 5),
                  Text("Tax \$13", style: cupertinoTextStyle.copyWith(color: CupertinoColors.secondaryLabel)),
                  const SizedBox(height: 5),
                  Text("Total \$${198 + 13}", style: cupertinoTextStyle.copyWith(color: CupertinoColors.label)),
                ],
              ),
            ),
          ],
        ));
  }
}
