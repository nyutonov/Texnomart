import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texnomart_demo/presentation/pages/cart/cart_page.dart';
import 'package:texnomart_demo/presentation/pages/orders/orders_page.dart';
import 'package:texnomart_demo/presentation/pages/profile/main/profile_page.dart';

import '../catalog/main/catalog_page.dart';
import '../home/main/home_page.dart';
import 'bottom_navigation_bloc.dart';

final pages = [
  const HomePage(),
  const CatalogPage(),
  const CartPage(),
  const OrdersPage(),
  const ProfilePage(),
];

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final bloc = BottomNavigationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.pageIndex ?? 0,
                onTap: (index) => bloc.add(ChangePage(index)),
                elevation: 12,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.black26,
                selectedItemColor: Colors.black,
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/icons/home.png')
                    ),
                    label: 'Bosh sahifa',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/icons/catalog.png')
                    ),
                    label: 'Katalog',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/icons/cart.png')
                    ),
                    label: 'Savatcha',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/icons/box.png')
                    ),
                    label: 'Buyurtmalar',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/icons/person.png')
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
              body: pages[state.pageIndex ?? 0]
          );
        },
      ),
    );
  }
}