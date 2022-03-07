import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/components/social_icon.dart';
import 'package:uipractice/data_models/menu_item.dart';

import 'menu_view_model.dart';

class MenuItems{
  static const payment = MenuItem('Payment',Icons.payment);
  static const promos = MenuItem('Promo',Icons.card_giftcard);
  static const notifications = MenuItem('Notification',Icons.add_alert);
  static const help = MenuItem('Help',Icons.help);
  static const aboutUs = MenuItem('About Us',Icons.info_outline);
  static const rateUs = MenuItem('Rate Us',Icons.star_border);
  static const signOut = MenuItem('Logout',Icons.logout);


  static const all = <MenuItem>[
    payment,
    promos,
    notifications,
    help,
    aboutUs,
    rateUs,
    signOut
  ];
}


class MenuView extends StatelessWidget {

  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuView({Key? key,required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder:() => getIt<MenuViewModel>(),
      builder: (context,model,child) => Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text('Ali Hassan',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('0333-1111999')
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40,),
                ...MenuItems.all.map(buildMenuItem).toList(),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      child: Image.asset('assets/images/main_top.png',width: 10,),
                      bottom: 0,
                      left: 0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
    selectedColor: Colors.white, // changing theme
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: currentItem == item,
      minLeadingWidth: 20,
      leading: Icon(item.iconData),
      title: Text(item.title),
      onTap: () => onSelectedItem(item),
    ),
  );
}
