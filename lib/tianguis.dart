import 'package:flutter/material.dart';

class Tianguis extends StatelessWidget {
  Tianguis({Key? key}) : super(key: key);

  final List<Item> items = [
    Item('Tianguis 1', 'assets/images/Tianguis1.jpg'),
    Item('Tianguis 2', 'assets/images/Tianguis2.jpg'),
    Item('Tianguis 4', 'assets/images/Tianguis3.jpg'),
    Item('Tianguis 5', 'assets/images/Tianguis4.jpg'),
    Item('Tianguis 6', 'assets/images/Tianguis5.jpg'),
    Item('Tianguis 7', 'assets/images/Tianguis6.jpg'),
    Item('Tianguis 8', 'assets/images/Tianguis7.jpg'),
    Item('Tianguis 9', 'assets/images/Tianguis8.jpg'),
    Item('Tianguis 10', 'assets/images/Tianguis9.jpg'),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Elimina la barra de aplicación
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8, // Ancho de la lista (ajustable)
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: Image.asset(
                  item.imagenUrl,
                  width: 75, // Establece el ancho deseado
                  height: 75, // Establece la altura deseada
                ),
                title: Text(item.nombre),
                subtitle: Text('Ubicado en:'),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Item {
  final String nombre;
  final String imagenUrl;

  Item(this.nombre, this.imagenUrl);
}
