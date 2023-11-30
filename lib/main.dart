import 'package:flutter/material.dart';
import 'inicio.dart';
import 'tianguis.dart';
import 'mapa.dart'; // Puedes eliminar esta línea si ya no necesitas el archivo mapa.dart
import 'package:flutter/material.dart';
import 'inicio.dart';
import 'top.dart'; // Importa el archivo top.dart en lugar de mapa.dart

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pueblanguis'),
          backgroundColor: Colors.green[700],
        ),
        body: _selectedIndex == 0
            ? Inicio()
            : _selectedIndex == 1
                ? MapSample()
                : _selectedIndex == 2
                    ? top() // Usa TopPage en lugar de MapSample
                    : Container(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_up),
              label: 'Top',
            ),
          ],
        ),
      ),
    );
  }
}
