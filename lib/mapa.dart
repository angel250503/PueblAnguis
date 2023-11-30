import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'descripcion.dart'; // Importa el archivo descripcion.dart

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class Place {
  final String id;
  final String name;
  final LatLng location;
  final List<String> imagePaths;
  String description; // Cambiado de 'final' a 'String'
  double rating;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.imagePaths,
    required this.description,
    required this.rating,
  });
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.04166989121933, -98.20900491464009),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(19.04166989121933, -98.20900491464009),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    setState(() {
      _markers = {
        Marker(
          markerId: MarkerId('tianguis1'),
          position: LatLng(19.075678, -98.143456),
          infoWindow: InfoWindow(
            title: 'Tianguis de Resurrección',
            snippet: _buildSnippet(_places[0]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[0],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis2'),
          position: LatLng(19.06253493015326, -98.13026874806951),
          infoWindow: InfoWindow(
            title: 'Tianguis INFONAVIT Bosques de San Sebastián Secc I',
            snippet: _buildSnippet(_places[1]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[1],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis3'),
          position: LatLng(19.077275065764784, -98.1412009846541),
          infoWindow: InfoWindow(
            title: 'Tianguis Bosques de Santa Anita',
            snippet: _buildSnippet(_places[2]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[2],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis4'),
          position: LatLng(19.053663345202335, -98.14681184539894),
          infoWindow: InfoWindow(
            title: 'Tianguis Manuel Rivera Naya',
            snippet: _buildSnippet(_places[3]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[3],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis5'),
          position: LatLng(19.046132652788682, -98.17890462400919),
          infoWindow: InfoWindow(
            title: 'Tianguis Xonaca',
            snippet: _buildSnippet(_places[4]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[4],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis6'),
          position: LatLng(19.041955, -98.195677),
          infoWindow: InfoWindow(
            title: 'Tianguis del Centro',
            snippet: _buildSnippet(_places[5]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[5],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis7'),
          position: LatLng(19.040846, -98.196327),
          infoWindow: InfoWindow(
            title: 'Tianguis de Antiguedades “Los Sapos”',
            snippet: _buildSnippet(_places[6]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[6],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis8'),
          position: LatLng(18.991107, -98.214226),
          infoWindow: InfoWindow(
            title: 'Tianguis San Isidro',
            snippet: _buildSnippet(_places[7]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[7],
              );
            },
          ),
        ),
        Marker(
          markerId: MarkerId('tianguis9'),
          position: LatLng(18.971846, -98.218567),
          infoWindow: InfoWindow(
            title: 'Tianguis 14 Sur',
            snippet: _buildSnippet(_places[8]),
            onTap: () {
              _showCustomInfoWindow(
                context,
                _places[8],
              );
            },
          ),
        ),
      };

      
    });

    // Asignar descripciones a los lugares
    _places[0].description = descripciones['tianguis1']!;
    _places[1].description = descripciones['tianguis2']!;
    _places[2].description = descripciones['tianguis3']!;
    _places[3].description = descripciones['tianguis4']!;
    _places[4].description = descripciones['tianguis5']!;
    _places[5].description = descripciones['tianguis6']!;
    _places[6].description = descripciones['tianguis7']!;
    _places[7].description = descripciones['tianguis8']!;
    _places[8].description = descripciones['tianguis9']!;
 
  }

  String _buildSnippet(Place place) {
    String stars = '★ ' * place.rating.floor();
    if (place.rating % 1 != 0) {
      stars += '½';
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Centrar'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  static Future<BitmapDescriptor> _bitmapDescriptorFromAsset(
      String assetName) async {
    final ByteData data = await rootBundle.load(assetName);
    final Uint8List bytes = data.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

void _showCustomInfoWindow(BuildContext context, Place place) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CarouselSlider(
                  items: place.imagePaths.map((imagePath) {
                    return Image.asset(
                      imagePath,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200.0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                  ),
                ),
                SizedBox(height: 8.0),
                // Texto formateado con saltos de línea
                Expanded(
                  child: ListView(
                    children: place.description
                        .split('\n')
                        .map((line) => Text(
                              line,
                              style: TextStyle(fontSize: 16.0),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(height: 8.0),
                RatingBar.builder(
                  initialRating: place.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      place.rating = rating;
                    });
                    _updateSnippet(place);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}



  void _updateSnippet(Place place) {
    String stars = '★' * place.rating.floor();
    if (place.rating % 1 != 0) {
      stars += '\u{00BD}';
    }

    Marker updatedMarker = Marker(
      markerId: MarkerId(place.id),
      position: place.location,
      infoWindow: InfoWindow(
        title: ' ${place.name}',
        snippet: stars,
        onTap: () {
          _showCustomInfoWindow(context, place);
        },
      ),
    );

    Set<Marker> updatedMarkers = Set.from(_markers);
    updatedMarkers.removeWhere((marker) => marker.markerId.value == place.id);
    updatedMarkers.add(updatedMarker);

    setState(() {
      _markers = updatedMarkers;
    });
  }

  List<Place> _places = [
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
      location: LatLng(19.077275065764784, -98.1412009846541
),
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
      rating: 4.5,
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
      rating: 4.5,
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
      rating: 4.5,
    ),


  ];
}
