import 'package:flutter/material.dart';
import 'package:hi_sudoku/widgets/bottom_buttons_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        drawer: const DrawerWidget(),
        body: Stack(
          children: [
            Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Hasta la vixsta baby',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const BottomButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
