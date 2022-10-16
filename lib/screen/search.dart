import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster/model/product_class.dart';

import '../utils/textstyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      margin: EdgeInsets.all(15),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(height: 50),
          CupertinoSearchTextField(
            controller: searchController,
            placeholder: "Shirt",
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Product.productList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if(index > 6){
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
                                  image: DecorationImage(image: AssetImage(product.images),fit: BoxFit.cover)
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.title,style: cupertinoTextStyle),
                                const SizedBox(height:10),
                                Text("\$${product.price}",style: cupertinoTextStyle),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: 30,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: CupertinoColors.systemBlue)
                              ),
                              child: Icon(CupertinoIcons.add,color: CupertinoColors.systemBlue,size: 15),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Divider(indent: MediaQuery.of(context).size.width * 0.30,height:0),
                    ],
                  );
                }
                 return const SizedBox();
              },
            ),
          )
        ],
      ),
    ));
  }
}
