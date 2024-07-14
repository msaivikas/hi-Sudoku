import 'package:flutter/material.dart';
import 'package:hi_sudoku/widgets/bottom_buttons_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import 'package:shake/shake.dart';

class WinningScreen extends StatefulWidget {
  const WinningScreen({super.key});

  @override
  State<WinningScreen> createState() => _WinningScreenState();
}

class _WinningScreenState extends State<WinningScreen> {
  late ShakeDetector detector;
  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(onPhoneShake: _handleShake);
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  void _handleShake() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Shake Detector'),
        content: const Text('You have shaked the phone'),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ok'))
        ],
      ),
    );
  }

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
                    const Text(
                      'You Won!',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _handleShake();
                      },
                      child: const Text(
                        'Shake',
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
