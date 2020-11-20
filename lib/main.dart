import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:convert';
import 'models/data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  Set<Marker> _mapMarkers = HashSet<Marker>();
  List<Data> _markers = List<Data>();

  static final CameraPosition _lleida = CameraPosition(
    target: LatLng(41.7500000, 0.3000000),
    zoom: 9,
  );

  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        _markers.addAll(value);
        for (int i = 0; i < _markers.length; i++) CreateMarker(i, _markers[i]);
      });
    });
  }

  Future<List<Data>> fetchData() async {
    String url = "https://api.atlantisfleet.com/WSapp/GPSservice.svc/GetUserDevices";
    String username = "demoATL";
    String password = "74437fbca39bc9dd2dc57a34c6891684";
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final response = await http.get(url, headers: <String, String>{'authorization': basicAuth});
    var markers = List<Data>();
    var responseJson = json.decode(response.body);
    for (var element in responseJson) markers.add(Data.fromJson(element));
    return markers;
  }

  void CreateMarker(int index, Data data) {
    _mapMarkers.add(
      Marker(
        markerId: MarkerId(index.toString()),
        position: LatLng(
          data.LastPosition.Latitude,
          data.LastPosition.Longitude,
        ),
        infoWindow: InfoWindow(
          title: data.DeviceName,
          snippet: data.DeviceId.toString(),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _lleida,
        markers: _mapMarkers,
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          
        )
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.settings, color: Colors.amber),
        onPressed: () {
          setState(() {
            showModalBottomSheet(context: context, builder: (context) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Text("X"),
              );
            });
          });
        },
      ),
    );
  }
}
