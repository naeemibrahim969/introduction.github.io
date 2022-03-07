import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:uipractice/app/locator.dart';
import 'package:uipractice/data_models/menu_item.dart';
import 'package:uipractice/ui/bottom_navigation/bottom_navigation_view.dart';
import 'package:uipractice/ui/counter/counter_view.dart';
import 'package:uipractice/ui/navigation_drawer/home_navigation_drawer_view_model.dart';
import 'package:uipractice/ui/payment/payment_view.dart';
import 'package:uipractice/ui/welcome/welcome_view.dart';
import 'menu/menu_view.dart';

class HomeNavigationDrawerView extends StatefulWidget {
  const HomeNavigationDrawerView({Key? key}) : super(key: key);

  @override
  _HomeNavigationDrawerViewState createState() =>
      _HomeNavigationDrawerViewState();
}

class _HomeNavigationDrawerViewState extends State<HomeNavigationDrawerView> {
  MenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeNavigationDrawerViewModel>.reactive(
        viewModelBuilder: () => getIt<HomeNavigationDrawerViewModel>(),
        builder: (context, model, child) => ZoomDrawer(
              style: DrawerStyle.Style1,
              borderRadius: 40,
              angle: -10,
              slideWidth: MediaQuery.of(context).size.width * 0.8,
              // showShadow: true,
              // backgroundColor: Colors.orangeAccent,
              menuScreen: Builder(builder: (context) {
                return MenuView(
                  currentItem: currentItem,
                  onSelectedItem: (item) {
                    setState(() {
                      currentItem = item;
                      ZoomDrawer.of(context)!.close();
                    });
                  },
                );
              }),
              mainScreen: getScreen(model),
            ));
  }

  Widget getScreen(HomeNavigationDrawerViewModel model) {
    switch (currentItem) {
      case MenuItems.payment:
        return PaymentView();
      case MenuItems.promos:
        return CounterView();
      case MenuItems.notifications:
        return BottomNavigationView();
      default:
        return PaymentView();
    }
  }
}
