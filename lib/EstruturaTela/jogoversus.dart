import 'package:flutter/material.dart';

class JogoVersus extends StatefulWidget {
  const JogoVersus({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JogoVersusState createState() => _JogoVersusState(); //Instância e Gerencia
}

// Classe de estado associada ao widget JogoVersus.
class _JogoVersusState extends State<JogoVersus> {
  List<String> board = List.generate(9, (_) => '');
  String currentPlayer = 'X';
  String winner = '';
  int xWins = 0;
  int oWins = 0;
  int draws = 0;

  // Método que reseta o estado do jogo.
  void _resetGame() {
    setState(() {
      board = List.generate(9, (_) => '');
      currentPlayer = 'X';
      winner = '';
    });
  }
  
  // Método que faz uma jogada no tabuleiro.
  void _makeMove(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentPlayer;
        if (_checkWinner(currentPlayer)) {
          winner = currentPlayer;
          _showEndGameDialog('$currentPlayer venceu!');
          if (currentPlayer == 'X') {
            xWins++;
          } else {
            oWins++;
          }
        } else if (!board.contains('')) {
          winner = 'Draw';
          _showEndGameDialog('Empate!'); 
          draws++;
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  // Método que verifica se o jogador atual venceu.
  bool _checkWinner(String player) {

    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    // Itera sobre cada padrão de vitória.
    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }

    return false;
  }

  // Método que mostra um diálogo de fim de jogo.
  void _showEndGameDialog(String message) {
    showDialog(
      context: context, // Contexto da árvore de widgets onde o diálogo será exibido.
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange, // Define a cor de fundo do diálogo.
          title: Text(
            message,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame(); // Reseta o jogo.
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmDialog() {
    showDialog(
      context: context, // Contexto da árvore de widgets onde o diálogo será exibido.
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.orange, // Define a cor de fundo do diálogo.
          title: const Text(
            'Tem certeza que deseja voltar ao menu?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  'Não',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo sem ação adicional.
              },
            ),
            TextButton(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  'Sim',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo.
                Navigator.of(context).pop(); // Navega de volta ao menu.
              },
            ),
          ],
        );
      },
    );
  }

  // Método obrigatório de um State que constrói a interface do usuário.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Define a cor de fundo do Scaffold.
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adiciona espaçamento horizontal em torno dos widgets internos.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100), // Espaçamento fixo vertical.
                const Text(
                  'Jogo Versus',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento fixo vertical.
                Text(
                  'Vencedor: $winner',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10), // Espaçamento fixo vertical.
                Text(
                  'X: $xWins  E: $draws  O: $oWins',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento fixo vertical.
                //Definição do Grid
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10, 
                      mainAxisSpacing: 10, 
                    ),
                    itemCount: 9, // Número de itens no grid.
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _makeMove(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.orange, // Cor de fundo do container.
                            borderRadius: BorderRadius.circular(8), // Bordas arredondadas.
                          ),
                          child: Center(
                            child: Text(
                              board[index],
                              style: const TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20), // Espaçamento fixo vertical.
                ElevatedButton(
                  onPressed: _resetGame, // Reseta o jogo ao ser pressionado.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Cor de fundo do botão.
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Espaçamento interno do botão.
                  ),
                  child: const Text(
                    'Reiniciar Jogo',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orange), // Ícone de voltar.
              onPressed: _showConfirmDialog, // Exibe o diálogo de confirmação ao ser pressionado.
            ),
          ),
        ],
      ),
    );
  }
}