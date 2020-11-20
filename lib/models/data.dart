import 'position.dart';

class Data {
  int DeviceId;
  String DeviceName;
  int DeviceTypeId;
  int FleetId;
  String FleetName;
  int GroupId;
  String GroupName;
  int IconId;
  String IconPath;

  //LastPosition
  Position LastPosition;

  int LastReceptionTime;
  int Status;

  Data({this.DeviceId, this.DeviceName, this.DeviceTypeId, this.FleetId, this.FleetName, 
  this.GroupId, this.GroupName, this.IconId, this.IconPath, 
  this.LastPosition
  });

  Data.fromJson(Map<String, dynamic> json) {    
    DeviceId = json['DeviceId'];
    DeviceName = json['DeviceName'];
    FleetId = json['FleetId'];
    DeviceTypeId = json['DeviceTypeId'];
    FleetId = json['FleetId'];
    FleetName = json['FleetName'];
    GroupId = json['GroupId'];
    GroupName = json['GroupName'];
    IconId = json['IconId'];
    IconPath = json['IconPath'];

    LastPosition = Position.fromJson(json['LastPosition']);
  }
}