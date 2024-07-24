import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/page/category/list_category.dart';
import 'package:responsive_admin_dashboard/page/order/order_page.dart';
import 'package:responsive_admin_dashboard/page/product/list_product.dart';
import 'package:responsive_admin_dashboard/page/retaurant/list_retaurant.dart';
import 'package:responsive_admin_dashboard/page/user/page_user.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.network("assets/images/logoapp_cut.png"),
          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {}),
          DrawerListTile(
              title: 'QL User',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecentUsersPage()),
                );
              }),
          DrawerListTile(
              title: 'Category',
              svgSrc: 'assets/icons/Message.svg',
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListPage()),
                );
              }),
          DrawerListTile(
              title: 'Product',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              }),
          DrawerListTile(
              title: 'Retaurant',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RetaurantListPage()),
                );
              }),
          DrawerListTile(
              title: 'Order',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderManagementPage()),
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Logout', svgSrc: 'assets/icons/Logout.svg', tap: () {}),
        ],
      ),
    );
  }
}
