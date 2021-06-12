import 'package:flutter/material.dart';
import 'package:wtime/services/world_time.dat.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime wtime = new WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
    await wtime.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': wtime.location,
      'flag': wtime.flag,
      'time': wtime.time,
      'isDayTime': wtime.isDaytime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/loading.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
