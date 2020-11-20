class Position {
  int Altitude;
  //List AnalogInputs;
  int GpsFix;
  String GpsTime;
  int Heading;
  int Kilometers;
  String LabelBattery;
  double Latitude;
  double Longitude;
  int Satellites;
  int Speed;
  int ValueBattery;


  Position({this.Altitude, this.GpsFix, this.GpsTime, this.Heading, this.Kilometers, this.LabelBattery,
  this.Latitude, this.Longitude, this.Satellites, this.Speed, this.ValueBattery});

  Position.fromJson(Map<String, dynamic> json) {    
    Altitude = json['Altitude'];
    //List AnalogInputs;
    GpsFix = json['GpsFix'];
    GpsTime = json['GpsTime'];
    Heading = json['Heading'];
    Kilometers = json['Kilometers'];
    LabelBattery = json['LabelBattery'];
    Latitude = json['Latitude'];
    Longitude = json['Longitude'];
    Satellites = json['Satellites'];
    Speed = json['Speed'];
    ValueBattery = json['ValueBattery'];
  }
}