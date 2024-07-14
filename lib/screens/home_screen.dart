import 'package:flutter/material.dart';
import 'package:hi_sudoku/widgets/bottom_buttons_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import './new_game_screen.dart';

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
            Positioned.fill(
              child: Container(
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewGameScreen()),
                        );
                      },
                      child: const Text(
                        'New Game',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Chats',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ],
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
