import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/features/home/view/home_viewmodel.dart';
import 'package:voting_app/features/home/widget/dashboard_view.dart';
import 'package:voting_app/features/home/widget/settings_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<Widget> homeScreens = <Widget>[
    const DashboardView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: (() => HomeViewModel()),
      builder: (context, viewModel, child) => Scaffold(
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
