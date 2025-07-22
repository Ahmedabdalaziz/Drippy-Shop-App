import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/block_back.dart';
import '../../logic/navigation_cubit.dart';

class Navigation extends StatefulWidget {

  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Orders Screen')),
    const Center(child: Text('Notifications Screen')),
    const Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NavigationCubit(),
      child: BackBlocker(
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, navState) {
            int actualCurrentIndex = 0;
            if (navState is NavigationTabSelected) {
              actualCurrentIndex = navState.currentIndex;
            }
            return Scaffold(
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: BottomNavigationBar(
                  iconSize: 20.0,
                  useLegacyColorScheme: false,
                  backgroundColor: context.colorScheme.background,
                  selectedItemColor: context.colorScheme.primary,
                  unselectedItemColor: context.colorScheme.outline,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: actualCurrentIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (idx) {
                    context.read<NavigationCubit>().selectTab(idx);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.house),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.bell),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.receipt),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.solidUser),
                      label: '',
                    ),
                  ],
                ),
              ),
              body: PageStorage(
                bucket: _bucket,
                child: IndexedStack(
                  index: actualCurrentIndex,
                  children: screens,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
