import 'dart:math';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import '../screens/winning_screen.dart';

class SudokuSquare extends StatelessWidget {
  final int? inputDigit;
  final VoidCallback onSelected;
  final bool isSelected;
  final bool isFixed;
  const SudokuSquare({
    super.key,
    this.inputDigit,
    required this.onSelected(),
    this.isSelected = false,
    required this.isFixed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isFixed ? onSelected : null,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: isSelected ? Colors.yellow : Colors.pink),
        child: Center(
          child: Text(
            inputDigit?.toString() ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: isFixed ? FontWeight.bold : FontWeight.normal,
              color: isFixed ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SudokuWidget extends StatefulWidget {
  const SudokuWidget({super.key});

  @override
  State<SudokuWidget> createState() => _SudokuWidgetState();
}

class _SudokuWidgetState extends State<SudokuWidget> {
  List<List<int?>> sudokuGrid =
      List.generate(9, (_) => List.generate(9, (_) => null));
  List<List<bool>> fixedGrid =
      List.generate(9, (_) => List.generate(9, (_) => false));
  List<List<int>> solutionGrid =
      List.generate(9, (_) => List.generate(9, (_) => 0));

  int? selectedRow;
  int? selectedCol;
  int squaresRemaining = 81;

  @override
  void initState() {
    super.initState();
    loadSudokuGrid();
  }

  void loadSudokuGrid() async {
    final input = await rootBundle.loadString('assets/sudoku_all_text.txt');
    List<List<dynamic>> fields =
        const CsvToListConverter(shouldParseNumbers: false).convert(input);

    Random random = Random();

    int randomIndex = random.nextInt(fields.length);

    String puzzle = fields[randomIndex][0];
    String solution = fields[randomIndex][1];

    List<List<int?>> grid =
        List.generate(9, (_) => (List.generate(9, (_) => null)));
    List<List<bool>> fixed =
        List.generate(9, (_) => (List.generate(9, (_) => false)));
    List<List<int>> solutionGridTemp =
        List.generate(9, (_) => (List.generate(9, (_) => 0)));
    int temp = 0;

    for (int i = 0; i < 9 && temp < 81; i++) {
      for (int j = 0; j < 9 && temp < 81; j++) {
        solutionGridTemp[i][j] = int.parse(solution[temp]);
        if (puzzle[temp] != '.') {
          grid[i][j] = int.parse(puzzle[temp]);
          fixed[i][j] = true;
          squaresRemaining--;
        }
        temp++;
      }
    }
    setState(() {
      sudokuGrid = grid;
      fixedGrid = fixed;
      solutionGrid = solutionGridTemp;
      squaresRemaining;
    });
  }

  void onSquareSelected(int row, int col) {
    if (fixedGrid[row][col] == false) {
      setState(() {
        selectedRow = row;
        selectedCol = col;
      });
    }
  }

  void onDigitChanged(int number) {
    if (selectedRow != null &&
        selectedCol != null &&
        !fixedGrid[selectedRow!][selectedCol!]) {
      setState(() {
        if (sudokuGrid[selectedRow!][selectedCol!] == null) {
          squaresRemaining--;
        }
        sudokuGrid[selectedRow!][selectedCol!] = number;
      });
    }
    if (squaresRemaining <= 0) {
      checkSudoku();
    }
  }

  checkSudoku() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (sudokuGrid[i][j] != solutionGrid[i][j]) {
          return;
        }
      }
    }
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WinningScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              for (int row = 0; row < 9; row++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int col = 0; col < 9; col++)
                      SudokuSquare(
                        onSelected: () => onSquareSelected(row, col),
                        inputDigit: sudokuGrid[row][col],
                        isSelected: selectedRow == row && selectedCol == col,
                        isFixed: fixedGrid[row][col],
                      ),
                  ],
                )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 5; i++)
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () => onDigitChanged(i),
                  child: Text(i.toString()),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 6; i <= 9; i++)
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () => onDigitChanged(i),
                  child: Text(i.toString()),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: ElevatedButton(
                  child: const Text('win(debug)'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WinningScreen()),
                    );
                  }),
            )
          ],
        ),
      ],
    );
  }
}
