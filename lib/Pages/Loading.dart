import 'package:flutter/material.dart';
import 'package:world_time/Services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime () async {
    WorldTime instance = WorldTime(location:'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });

  }


  @override     ///Overrides the init function of parent-class
  void initState() {
    super.initState();   ///Commands to run the init function of parent-class first
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body : Center(
        child : SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
