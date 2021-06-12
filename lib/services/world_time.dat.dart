import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the UI
  String time; // time in that location
  String flag; //url to an asset flag icon
  String url; // location url for api end point

  int isDaytime; //true or false if daytime or not

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {

    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//    print(data);

      //get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,1);
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(datetime);
      if(offset=="+") {
        now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      }else{
        now = now.subtract(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      }
//    print(offset);


      //set the time property
      if(now.hour >2 && now.hour<9){
        isDaytime=0;
      }else if(now.hour>=9 && now.hour<=16){
        isDaytime=1;
      }else if(now.hour>16 && now.hour<20){
        isDaytime=2;
      }else{
        isDaytime=3;
      }
      time = DateFormat.jm().format(now);
    }catch(e){
      print('caught error: $e');
      time = 'Couldn\'t get time data!';
    }
  }
}

//WorldTime wtime = WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');