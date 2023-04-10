import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/constants/color_list.dart';
import 'package:voting_app/features/home/view/home_viewmodel.dart';
import 'package:voting_app/features/home/widget/dashboard_view.dart';
import 'package:voting_app/features/home/widget/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> homeScreens = <Widget>[
      DashboardView(),
      SettingsView(),
    ];
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: (() => HomeViewModel()),
      builder: (context, viewModel, child) => Scaffold(
        /* appBar: AppBar(
          title: const Text(
            'Nigeria 2023 Election',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: ColorList.primaryColor,
          actions: const [
            Icon(
              Icons.power_settings_new,
              color: Colors.white,
            )
          ],
        ), */
        body: SizedBox.expand(
          child: homeScreens.elementAt(viewModel.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: viewModel.selectedIndex,
          onTap: viewModel.onItemTapped,
        ),
      ),
    );
  }
}
