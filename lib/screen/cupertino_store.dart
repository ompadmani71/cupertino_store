import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster/screen/HomeScreen.dart';
import 'package:outcaster/screen/cart.dart';
import 'package:outcaster/screen/search.dart';

import '../utils/image.dart';
import '../utils/strings.dart';
import '../utils/textstyle.dart';

class CupertinoStore extends StatefulWidget {
  const CupertinoStore({Key? key}) : super(key: key);

  @override
  State<CupertinoStore> createState() => _CupertinoStoreState();
}

class _CupertinoStoreState extends State<CupertinoStore> {
  int i=0;
 DateTime selected=DateTime.now() ;
  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart),
        ),
      ],
        ),
      tabBuilder: (BuildContext context, int index) {
       return CupertinoTabView(
          builder: (context){
            return (index == 0) ? const HomePage() : (index == 1) ? const SearchPage() : const CartPage();
          },
        );
      },
    );
  }
}
