import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> _board = ['', '', '', '', '', '', '', '', ''];
  String _turn = 'X';
  bool _gameOver = false;
  String _winner = '';

  void _makeMove(int index) {
    if (_gameOver) return;

    if (_board[index] == '') {
      setState(() {
        _board[index] = _turn;
        if (_checkForWin()) {
          _gameOver = true;
          _winner = _turn;
        } else if (_checkForDraw()) {
          _gameOver = true;
        } else {
          _turn = _turn == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkForWin() {
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      if (_board[combination[0]] == _board[combination[1]] &&
          _board[combination[1]] == _board[combination[2]] &&
          _board[combination[0]] != '') {
        return true;
      }
    }
    return false;
  }

  bool _checkForDraw() {
    return !_board.contains('');
  }

  void _resetGame() {
    setState(() {
      _board = ['', '', '', '', '', '', '', '', ''];
      _turn = 'X';
      _gameOver = false;
      _winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _gameOver
              ? Text(
                  _winner.isEmpty ? 'It\'s a draw!' : 'Player $_winner wins!',
                  style: const TextStyle(fontSize: 24),
                )
              : const Text(''),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _makeMove(index),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      _board[index],
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _resetGame,
            child: const Text('Reset Game'),
          ),
        ],
      ),
    );
  }
}
