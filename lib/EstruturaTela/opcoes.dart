import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Opcoes extends StatefulWidget {
  const Opcoes({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OpcoesState createState() => _OpcoesState();
}

class _OpcoesState extends State<Opcoes> {
  Color _primaryColor = Colors.orange;
  Color _secondaryColor = Colors.black;

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('Tem certeza de que deseja sair sem salvar as alterações?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo.
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo.
                Navigator.of(context).pop(); // Volta para a tela anterior.
              },
              child: const Text('Sair'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opções'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orange), // Ícone de voltar.
              onPressed: _showConfirmDialog, // Exibe o diálogo de confirmação ao ser pressionado.
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Escolha a cor primária:'),
                ColorPicker(
                  pickerColor: _primaryColor,
                  onColorChanged: (color) {
                    setState(() {
                      _primaryColor = color;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text('Escolha a cor secundária:'),
                ColorPicker(
                  pickerColor: _secondaryColor,
                  onColorChanged: (color) {
                    setState(() {
                      _secondaryColor = color;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'primaryColor': _primaryColor,
                        'secondaryColor': _secondaryColor,
                      });
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
