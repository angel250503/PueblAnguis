// top.dart

import 'package:flutter/material.dart';
import 'mapa.dart'; // Asegúrate de importar el archivo mapa.dart
import 'package:google_maps_flutter/google_maps_flutter.dart';

class top extends StatelessWidget {
  // Lista de lugares
  final List<Place> places = [
    Place(
      id: 'tianguis1',
      name: 'Tianguis de Resurrección',
      location: LatLng(19.075678, -98.143456),
      imagePaths: [
        'assets/images/resureccion1.jpg',
        'assets/images/resureccion1.jpg',
        'assets/images/resureccion2.jpg',
        'assets/images/resureccion3.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 4.5,
    ),
    Place(
      id: 'tianguis2',
      name: 'Tianguis INFONAVIT Bosques de San Sebastián Secc I',
      location: LatLng(19.06253493015326, -98.13026874806951),
      imagePaths: [
        'assets/images/BosquesdeSansebastian.jpg',
        'assets/images/BosquesdeSansebastian1.jpg',
        'assets/images/BosquesdeSansebastian2.jpg',
        'assets/images/BosquesdeSansebastian3.jpg',
        'assets/images/BosquesdeSanSebastian4.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 3.5,
    ),
    Place(
      id: 'tianguis3',
      name: 'Tianguis Bosques de Santa Anita',
      location: LatLng(19.077275065764784, -98.1412009846541),
      imagePaths: [
        'assets/images/resureccion1.jpg',
        'assets/images/resureccion1.jpg',
        'assets/images/resureccion2.jpg',
        'assets/images/resureccion3.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 4.5,
    ),
    Place(
      id: 'tianguis4',
      name: 'Tianguis Manuel Rivera Naya',
      location: LatLng(19.053663345202335, -98.14681184539894),
      imagePaths: [
        'assets/images/riveraanaya1.jpg',
        'assets/images/riveraanaya2.jpg',
        'assets/images/riveraanaya3.jpg',
        'assets/images/riveraanaya4.jpg',
        'assets/images/riveraanaya5.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 4.5,
    ),
    Place(
      id: 'tianguis5',
      name: 'Tianguis Xonaca',
      location: LatLng(19.046132652788682, -98.17890462400919),
      imagePaths: [
        'assets/images/xonaca1.jpg',
        'assets/images/xonaca2.jpg',
        'assets/images/xonaca3.jpg',
        'assets/images/xonaca4.jpg',
        'assets/images/xonaca5.jpg',
        'assets/images/xonaca6.jpg',
        'assets/images/xonaca7.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 1,
    ),
    Place(
      id: 'tianguis6',
      name: 'Tianguis del Centro',
      location: LatLng(19.041955, -98.195677),
      imagePaths: [
        'assets/images/centro1.jpg',
        'assets/images/centro2.jpg',
        'assets/images/centro3.jpg',
        'assets/images/centro4.jpg',
        'assets/images/centro5.jpg',
        'assets/images/centro6.jpg',
        'assets/images/centro7.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 4.5,
    ),
    Place(
      id: 'tianguis7',
      name: 'Tianguis de Antiguedades “Los Sapos”',
      location: LatLng(19.040846, -98.196327),
      imagePaths: [
        'assets/images/lossapos1.jpg',
        'assets/images/lossapos2.jpg',
        'assets/images/lossapos3.jpg',
        'assets/images/lossapos4.jpg',
        'assets/images/lossapos5.jpg',
        'assets/images/lossapos6.jpg',
        'assets/images/lossapos7.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 1.5,
    ),
    Place(
      id: 'tianguis8',
      name: 'Tianguis San Isidro',
      location: LatLng(18.991107, -98.214226),
      imagePaths: [
        'assets/images/sanisidro1.jpg',
        'assets/images/sanisidro2.jpg',
        'assets/images/sanisidro3.jpg',
        'assets/images/sanisidro4.jpg',
        'assets/images/sanisidro5.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 4.5,
    ),
    Place(
      id: 'tianguis9',
      name: 'Tianguis 14 Sur',
      location: LatLng(18.971846, -98.218567),
      imagePaths: [
        'assets/images/14sur.jpg',
        'assets/images/14sur1.jpg',
        'assets/images/14sur2.jpg',
        'assets/images/14sur3.jpg',
        'assets/images/14sur4.jpg',
        'assets/images/14sur5.jpg',
        'assets/images/14sur6.jpg',
      ],
      description: '', // Dejado en blanco para asignar más tarde
      rating: 2.5,
    ),
    // Agrega más lugares si es necesario
  ];

  @override
  Widget build(BuildContext context) {
    // Ordenar la lista de lugares por rating (de mayor a menor)
    places.sort((a, b) => b.rating.compareTo(a.rating));

    return Scaffold(
      appBar: null, // Establecer la AppBar como null para ocultarla
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            title: Text(place.name),
            subtitle: Text("Rating: ${place.rating}"),
            // Agrega un onTap para mostrar más detalles si es necesario
          );
        },
      ),
    );
  }
}
