import 'package:flutter/material.dart';
import '../widgets/sudoku_widget.dart';
import 'package:hi_sudoku/widgets/bottom_buttons_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(),
        drawer: DrawerWidget(),
        body: Stack(
          children: [
            SudokuWidget(),
            BottomButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
