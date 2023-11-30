import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mapa.png'), // Reemplaza 'tu_imagen.png' con el nombre de tu imagen
            fit: BoxFit.cover, // Para que la imagen ocupe toda la pantalla
          ),
        ),
      ),
    );
  }
}
